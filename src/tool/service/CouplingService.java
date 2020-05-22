package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class CouplingService {

	public ArrayList<Coupling> test(String code) {
		
        int count = 0;
        boolean inside_Method=false;
        int inside_Method_count=0;
        int line_Count=0;
        String[] m_Store=finding_methods(code).split("@");
        String m_Name=null;
        ArrayList<Coupling> list = new ArrayList<Coupling>();
        int insideClass =0;

        String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            count++;
            String[] code_line_string  = line.split("\"");
            int regular_Global=0;
            int recursive_Global=0;
            int recursive=0;
            int regular_Regular=0;
            int regular_Recursive=0;
            int recursive_Regular=0;
            int recursive_Recursive=0;
    		
            for (int i=1;i<=code_line_string.length;i++) {
        		
            	if(i%2==1) {
            		
            		String test =code_line_string[i-1];
            		
        			String str= test.replaceAll("\\s+","_");
        			
        			String reg_ptr = "public_|protected_|private_";
            		Pattern pattern = Pattern.compile(reg_ptr, Pattern.CASE_INSENSITIVE);
            		Matcher matcher = pattern.matcher(str);
            		while (matcher.find())
            		{
            			String smpl_str1= test.replaceAll("\\s+","");
            			String smpl_str2= smpl_str1.replaceAll("\\)","@");
            			String smpl_str3= smpl_str2.replaceAll("\\{","-.X");
            			
            			String reg_ptr1 = "@-.X"; 
                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                		Matcher mtr1 = ptrn1.matcher(smpl_str3);
                		while (mtr1.find())
                		{
                			String smpl_str4= test.replaceAll("\\(","@@");
                			String[] sample  = smpl_str4.split("@@");
                			
                			String smpl_str5= sample[0].replaceAll("\\s+","_");
                			String reg_ptr3 = "_boolean_|_byte_|_char_|_double_|_float_|_int_|_long_|_short_|_String_|_void_"; 
                    		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                    		Matcher mtr3 = ptrn3.matcher(smpl_str5);
                    		while (mtr3.find())
                    		{
                    			String[] sample1  = (smpl_str5.substring(mtr3.end(),smpl_str5.length())).split("_");
                    			m_Name = sample1[0];
                    			inside_Method=true;
                    		}
                    		
                		}

            		}
            		
            		if(inside_Method) {
            			String reg_ptr2 = "get|set|add"; 
                		Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                		Matcher mtr2 = ptrn2.matcher(test);
                		while (mtr2.find())
                		{
                			boolean ch=false;
                			String test2= test.replaceAll("\\(","-.X");
                    		String reg_ptr3 = "-.X"; 
                    		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                    		Matcher mtr3 = ptrn2.matcher(test2);
                    		while (mtr3.find())
                    		{
                    			ch=true;
                    		}
                    		
                    		if(ch) {
                    			regular_Regular++;
                    		}
                    		
                		}
            		}
            		
            		if(inside_Method) {
            			line_Count++;

                		String smpl_str1= test.replaceAll("\\{","@@");
            			
            			String reg_ptr1 = "@@"; 
                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                		Matcher mtr1 = ptrn1.matcher(smpl_str1);
                		while (mtr1.find())
                		{
                			inside_Method_count++;
                		}
                		
                		String smpl_str2= test.replaceAll("\\}","@@");
            			
            			String reg_ptr2 = "@@"; 
                		Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                		Matcher mtr2 = ptrn2.matcher(smpl_str2);
                		while (mtr2.find())
                		{
                			inside_Method_count--;
                		}
                		
                		if(inside_Method_count==0) {
                			inside_Method=false;
                			line_Count=0;
                			m_Name=null;
                			insideClass=0;
                		}else {
                			for(int k = 0; k < m_Store.length; k++) {
                				if(k%2==0) {
                					boolean check=false;
                        			
                					String smpl_str3= str.replaceAll("\\(","@");
                					String smpl_str4= smpl_str3.replaceAll("\\+","@@");
                					String smpl_str5= smpl_str4.replaceAll("\\-","@@");
                					String smpl_str6= smpl_str5.replaceAll("\\*","@@");
                					String smpl_str7= smpl_str6.replaceAll("\\/","@@");
                					
                        			String reg_ptr3 = "_"+m_Store[k]+"_|_"+m_Store[k]+"@|@@"+m_Store[k];
                            		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                            		Matcher mtr3 = ptrn3.matcher(smpl_str7);
                            		while (mtr3.find())
                            		{
                            			check=true;
                            		}
                            		
                            		if(check) {
                            			if(m_Store[k+1]=="Global") {
                            				
                            				for(int m = 0; m < m_Store.length; m++) {
                            					if(m%2==0) {
                            						if(m_Name==m_Store[m]) {
                            							if(m_Store[m+1].equals("regular")) {
                            								regular_Global++;
                            							}else {
                            								recursive_Global++;
                            							}
                            						}
                            					}
                            				}
                            				
                            			}else {
                            				if(line_Count>1) {
                                				if(m_Name.equals(m_Store[k])) {
                                					recursive++;
                                				}else {
                                					
                                					for(int m = 0; m < m_Store.length; m++) {
                                    					if(m%2==0) {
                                    						if(m_Name.equals(m_Store[m])) {
                                    							if(m_Store[m+1].equals("regular")) {
                                    								if(m_Store[k+1].equals("regular")) {
                                    									regular_Regular++;
                                    								}else {
                                    									regular_Recursive++;
                                    								}
                                    							}else {
                                    								if(m_Store[k+1].equals("regular")) {
                                    									recursive_Regular++;
                                    								}else {
                                    									recursive_Recursive++;
                                    								}
                                    							}
                                    						}
                                    					}
                                    				}
                                					
                                				}
                            				}
                            			}
                            		}
                				}
                			}
                		}
            		}
            	}
            }
            
            Coupling coupling = new Coupling();
            
            coupling.setLine(line);
            coupling.setLineNumber(count);
            coupling.setRecursive(recursive);
            coupling.setRecursive_global(recursive_Global);
            coupling.setRecursive_recursive(recursive_Recursive);
            coupling.setRecursive_regular(recursive_Regular);
            coupling.setRegular_recursive(regular_Recursive);
            coupling.setRegular_regular(regular_Regular);
            coupling.setRegular_global(regular_Global);
            
            list.add(coupling);
            
        }
		
        return list;
		
    }
	
    public String finding_methods(String code) {
		
        int count = 0;
        boolean inside_Method=false;
        int inside_Method_count=0;
        int line_Count=0;
        boolean regular=true;
        String m_Store="";
        String m_Name=null;

        String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            count++;
            String[] code_line_string  = line.split("\"");
            
            for (int i=1;i<=code_line_string.length;i++) {
        		
            	if(i%2==1) {
            		
            		String test =code_line_string[i-1];
            		
        			String str= test.replaceAll("\\s+","_");
        			
        			String reg_ptr = "public_|protected_|private_"; 
            		Pattern pattern = Pattern.compile(reg_ptr, Pattern.CASE_INSENSITIVE);
            		Matcher matcher = pattern.matcher(str);
            		while (matcher.find())
            		{
            			String smpl_str1= test.replaceAll("\\s+","");
            			String smpl_str2= smpl_str1.replaceAll("\\)","@");
            			String smpl_str3= smpl_str2.replaceAll("\\{","-.X");
            			
            			String reg_ptr1 = "@-.X"; 
                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                		Matcher mtr1 = ptrn1.matcher(smpl_str3);
                		while (mtr1.find())
                		{
                			String smpl_str4= test.replaceAll("\\(","@@");
                			String[] sample  = smpl_str4.split("@@");
                			
                			String smpl_str5= sample[0].replaceAll("\\s+","_");
                			String reg_ptr3 = "_boolean_|_byte_|_char_|_double_|_float_|_int_|_long_|_short_|_String_|_void_"; 
                    		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                    		Matcher mtr3 = ptrn3.matcher(smpl_str5);
                    		while (mtr3.find())
                    		{
                    			String[] sample1  = (smpl_str5.substring(mtr3.end(),smpl_str5.length())).split("_");
                    			m_Name = sample1[0];
                    			inside_Method=true;
                    		}
                    		
                		}
            		}
            		
            		if(inside_Method) {
            			line_Count++;

                		String smpl_str1= test.replaceAll("\\{","@@");
            			
            			String reg_ptr1 = "@@"; 
                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                		Matcher mtr1 = ptrn1.matcher(smpl_str1);
                		while (mtr1.find())
                		{
                			inside_Method_count++;
                		}
                		
                		String smpl_str2= test.replaceAll("\\}","@@");
            			
            			String reg_ptr2 = "@@"; 
                		Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                		Matcher mtr2 = ptrn2.matcher(smpl_str2);
                		while (mtr2.find())
                		{
                			inside_Method_count--;
                		}
                		
                		if(line_Count>1) {
                			
	                		String smpl_str3= test.replaceAll("\\s+","_").replaceAll("\\(","@@");
	            			
	            			String reg_ptr3 = "_"+m_Name+"@@|_"+m_Name+"_"; 
	                		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr3 = ptrn3.matcher(smpl_str3);
	                		while (mtr3.find())
	                		{
	                			regular=false;
	                		}
                		}
                		
                		
                		if(inside_Method_count==0) {
                			inside_Method=false;
                			line_Count=0;
                			if(regular) {
                				if(m_Store=="") {
                					m_Store=m_Name+"@regular";
                				}else {
                					m_Store=m_Store+"@"+m_Name+"@regular";
                				}
                			}else {
                				if(m_Store=="") {
                					m_Store=m_Name+"@recursive";
                				}else {
                					m_Store=m_Store+"@"+m_Name+"@recursive";
                				}
                			}
                			m_Name=null;
                			regular=true;
                		}
                		
            		}else {
            			
            			String reg_ptr1 = "boolean|byte|char|double|float|int|long|short|String"; 
                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                		Matcher mtr1 = ptrn1.matcher(test);
                		while (mtr1.find())
                		{
                			String reg_ptr2 = ";"; 
                    		Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                    		Matcher mtr2 = ptrn2.matcher(test);
                    		while (mtr2.find())
                    		{
                    			String line_var= test.substring(mtr1.end(),mtr2.start());
                    			String[] var_arr  = line_var.split("=\\,\\;");
                    			for(int k = 0; k < var_arr.length; k++) {
                    				String[] var_arr1  = line_var.split(",");
                    				for(int m = 0; m < var_arr1.length; m++) {
                    					if(m==0) {
                    						if(m_Store=="") {
                    							m_Store=var_arr1[0]+"@Global";
                    						}else {
                    							m_Store=m_Store+"@"+var_arr1[0]+"@Global";
                    						}
                    					}
                    				}
                                }
                    		}
                		}
            		}
            		
            	}
            }
        }
        
        return m_Store;

    }
	
}

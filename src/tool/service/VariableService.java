package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class VariableService {

	public ArrayList<Variables> test(String code) {
		
		int count = 0;
		int method = 0;
		ArrayList<Variables> variablesList = new ArrayList<Variables>();
		
		String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            System.out.println("line " + count++ + " : " + line);
            String[] findString  = line.split("\"");
            int Global =0;
            int local=0;
            int composite=0;
            
            for (int i=1;i<=findString.length;i++) {
        		
            	if(i%2==1) {
            		
            		String test =findString[i-1];
            		
        			String str= test.replaceAll("\\{","@X@");
        			
        			String mainString= test.replaceAll("\\s+","_");
            		
            		String regex = "@X@"; 
            		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
            		Matcher matcher = pattern.matcher(str);
            		while (matcher.find())
            		{
            			method++;
            		}
            		
            		if(method==1) {
        				
        				String regex1 = "_boolean_|_byte_|_char_|_double_|_float_|_int_|_long_|_short_|_String_"; 
                		Pattern pattern1 = Pattern.compile(regex1, Pattern.CASE_INSENSITIVE);
                		Matcher matcher1 = pattern1.matcher(mainString);
                		while (matcher1.find())
                		{
                			String regex2 = ";"; 
                    		Pattern pattern2 = Pattern.compile(regex2, Pattern.CASE_INSENSITIVE);
                    		Matcher matcher2 = pattern2.matcher(test);
                    		while (matcher2.find())
                    		{
                    			String line_var= test.substring(matcher1.end(),matcher2.start());
                    			String[] var_arr  = line_var.split("=\\,\\;");
                    			for(int k = 0; k < var_arr.length; k++) {
                    				String[] var_arr1  = line_var.split(",");
                    				for(int m = 0; m < var_arr1.length; m++) {
                						Global++;
                    				}
                                }
                    		}
                    		
                    		String str1 = test.replaceAll("\\d+", "_X_");
                    		String str2 = str1.replaceAll("\\[", "@");
                    		String str3 = str2.replaceAll("\\]", ".");
                    		String regex3 = "@_X_.|@."; 
                    		Pattern pattern3 = Pattern.compile(regex3, Pattern.CASE_INSENSITIVE);
                    		Matcher matcher3 = pattern3.matcher(str3);
                    		while (matcher3.find())
                    		{
                    			String regex4 = ";"; 
                        		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                        		Matcher matcher4 = pattern2.matcher(test);
                        		while (matcher4.find())
                        		{
                        			String line_var= test.substring(matcher1.end(),matcher4.start());
                        			String[] var_arr  = line_var.split("=\\,\\;");
                        			for(int k = 0; k < var_arr.length; k++) {
                        				String[] var_arr1  = line_var.split(",");
                        				for(int m = 0; m < var_arr1.length; m++) {
                    						composite++;
                        				}
                                    }
                        		}
                    		}
                    		
                		}
                		String regex4 = "_Dimension_"; 
                		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                		Matcher matcher4 = pattern4.matcher(mainString);
                		while (matcher4.find())
                		{
                			composite++;
                		}
        				
        			}
            		
            		
            		if(method>1) {
            			String regex1 = "if|while|do|for"; 
                		Pattern pattern1 = Pattern.compile(regex1, Pattern.CASE_INSENSITIVE);
                		Matcher matcher1 = pattern1.matcher(test);
                		
            			if(!matcher1.find()) {
            				String regex3 = "_boolean_|_byte_|_char_|_double_|_float_|_int_|_long_|_short_|_String_"; 
                    		Pattern pattern3 = Pattern.compile(regex3, Pattern.CASE_INSENSITIVE);
                    		Matcher matcher3 = pattern3.matcher(mainString);
                    		while (matcher3.find())
                    		{
                    			String regex2 = ";"; 
                        		Pattern pattern2 = Pattern.compile(regex2, Pattern.CASE_INSENSITIVE);
                        		Matcher matcher2 = pattern2.matcher(test);
                        		while (matcher2.find())
                        		{
                        			String line_var= test.substring(matcher3.end(),matcher2.start());
                        			String[] var_arr  = line_var.split("=\\,\\;");
                        			for(int k = 0; k < var_arr.length; k++) {
                        				String[] var_arr1  = line_var.split(",");
                        				for(int m = 0; m < var_arr1.length; m++) {
                    						local++;
                    						System.out.println(var_arr1[m]);
                        				}
                                    }
                        		}
                        		

                        		String str1 = test.replaceAll("\\d+", "_X_");
                        		String str2 = str1.replaceAll("\\[", "@");
                        		String str3 = str2.replaceAll("\\]", ".");
                        		String regex4 = "@_X_.|@."; 
                        		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                        		Matcher matcher4 = pattern4.matcher(str3);
                        		while (matcher4.find())
                        		{
                        			String regex5 = ";"; 
                            		Pattern pattern5 = Pattern.compile(regex5, Pattern.CASE_INSENSITIVE);
                            		Matcher matcher5 = pattern2.matcher(test);
                            		while (matcher5.find())
                            		{
                            			String line_var= test.substring(matcher3.end(),matcher5.start());
                            			String[] var_arr  = line_var.split("=\\,\\;");
                            			for(int k = 0; k < var_arr.length; k++) {
                            				String[] var_arr1  = line_var.split(",");
                            				for(int m = 0; m < var_arr1.length; m++) {
                    							composite++;
                            				}
                                        }
                            		}
                        		}
                    		}
                    		
                    		String regex4 = "_Dimension_"; 
                    		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                    		Matcher matcher4 = pattern4.matcher(mainString);
                    		while (matcher4.find())
                    		{
                    			composite++;
                    		}
            			}
            		}
            	}
            	System.out.println(" g "+Global+" l "+local+" c "+composite);
            }
            Variables list = new Variables();
            
            list.setLine(line);
            list.setLineNumber(count);
            list.setComposite(composite);
            list.setGlobal(Global);
            list.setLocal(local);

            variablesList.add(list);
        }
		return variablesList;
		
	}
	
}

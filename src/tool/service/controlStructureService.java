package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class controlStructureService {

	public ArrayList<Control> test(String code,int conditionz,int loops,int weightSwitch,int weightCase) {
		
	        int count = 0;
	        int if_weight = conditionz;
	        int loop = loops;
	        int weight_Switch = weightSwitch;
	        int weight_Case = weightCase;
	        String control="";
	        boolean checkCon=false;
	        ArrayList<Control> list = new ArrayList<Control>();

	        String[] lines = code.split("\\r?\\n");
	        for (String line : lines) {
	            count++;
	            String[] code_line_string  = line.split("\"");
	            int no_Of_Control=0;
	            int loops_Count=0;
	            int condition_count=0;
	            int count_Switch=0;
	            int line_Weight=0;
	            int case_Count=0;
	            int cspps=0;
	            
	            for (int i=1;i<=code_line_string.length;i++) {
	        		
	            	if(i%2==1) {
	            		
	            		String test =code_line_string[i-1];
	            		
	        			String smpl_str= (test.replaceAll("\\s+","_")).replaceAll("\\(","@");
	        			String reg_ptr = "do@|if@|while@|case_|switch@|do_@|if_@|while_@|switch_@|for_@|for@"; 
	            		Pattern pattern = Pattern.compile(reg_ptr, Pattern.CASE_INSENSITIVE);
	            		Matcher matcher = pattern.matcher(smpl_str);
	            		while (matcher.find())
	            		{
	            			no_Of_Control++;
	            			
	            			String smpl_str2= test.replaceAll("\\s+","");
	            			String smpl_str3= smpl_str2.replaceAll("\\(","@");
	            			String reg_ptr1 = "if@"; 
	                		Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr1 = ptrn1.matcher(smpl_str3);
	                		while (mtr1.find())
	                		{
	                			control = control+"if#";
	                			condition_count++;
	                		}
	                		
	                		String reg_ptr2 = "for@"; 
	                		Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr2 = ptrn2.matcher(smpl_str3);
	                		while (mtr2.find())
	                		{
	                			control = control+"for#";
	                			loops_Count++;
	                		}

	            			String smpl_str4= smpl_str2.replaceAll("\\{","@");
	                		String reg_ptr3 = "do@"; 
	                		Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr3 = ptrn3.matcher(smpl_str4);
	                		while (mtr3.find())
	                		{
	                			control = control+"do#";
	                			loops_Count++;
	                		}
	                		
	                		String reg_ptr4 = "while@"; 
	                		Pattern ptrn4 = Pattern.compile(reg_ptr4, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr4 = ptrn4.matcher(smpl_str3);
	                		while (mtr4.find())
	                		{
	                			String smpl_str5= smpl_str2.replaceAll("\\)","@");
	                			String smpl_str6= smpl_str5.replaceAll("\\{","-.X");
	                			
	                			String reg_ptr5 = "@-.X"; 
	                    		Pattern ptrn5 = Pattern.compile(reg_ptr5, Pattern.CASE_INSENSITIVE);
	                    		Matcher mtr5 = ptrn5.matcher(smpl_str6);
	                    		while (mtr5.find())
	                    		{
	                    			control = control+"while#";
	                    			loops_Count++;
	                    		}
	                		}
	                		
	            			String reg_ptr6 = "switch@"; 
	                		Pattern ptrn6 = Pattern.compile(reg_ptr6, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr6 = ptrn6.matcher(smpl_str3);
	                		while (mtr6.find())
	                		{
	                			control = control+"switch#";
	                			count_Switch++;
	                		}
	                		
	                		String reg_ptr7 = "@@"; 
	                		Pattern ptrn7 = Pattern.compile(reg_ptr7, Pattern.CASE_INSENSITIVE);
	                		Matcher mtr7 = ptrn7.matcher(test.replaceAll("\\&&","@@"));
	                		while (mtr7.find())
	                		{
	                			no_Of_Control++;
	                		}
	                		checkCon=true;
	            		}
	            		
	            		if(checkCon) {
	            			String smpl_str1= (test.replaceAll("\\s+","_")).replaceAll("\\}","@@");
	            			String reg_ptr1 = "@@"; 
	                		Pattern pattern1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
	                		Matcher matcher1 = pattern1.matcher(smpl_str1);
	                		while (matcher1.find())
	                		{
	                			if(control!="") {
	                				String[] lop  = control.split("#");
	                				control="";
	                				for(int j=0;j<lop.length-1;j++) {
	                					control=control+lop[j]+"#";
	                				}
	                			}
	                		}
	            		}
	            	}
	            }
	            
	            case_Count=no_Of_Control-count_Switch-loops_Count-condition_count;
	            
	            if(no_Of_Control>0) {
	            	line_Weight=(count_Switch*weight_Switch)+case_Count+(loops_Count*loop)+(condition_count*if_weight);
	            	
	                String[] lop  = control.split("#");
	                if(lop.length>1) {
	                	int current=lop.length;
	                	
	                	for(int j=0;j<current-1;j++) {
	                		
	                		if(lop[j].equals("if")) {
	                			cspps=cspps+if_weight;
	                		}else if(lop[j].equals("for")||lop[j].equals("do")||lop[j].equals("while")) {
	                			cspps=cspps+loop;
	                		}else if(lop[j].equals("switch")) {
	                			cspps=cspps+weight_Switch;
	                		}
	                		
	                	}
	                	
	                }
	            	
	            }
	            
	            Control controls = new Control();
	            
	            controls.setLine(line);
	            controls.setLineNumber(count);
	            controls.setCspps(cspps);
	            controls.setLine_weight(line_Weight);
	            controls.setNo_of_control(no_Of_Control);
	            
	            list.add(controls);
	            
	        }
			
	        return list;
			
	    }
	
}

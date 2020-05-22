package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class codeSizeService {
	
	/* Create arrylistTpe method */
	public ArrayList<size> test(String code) {
		
		int count = 0;
		String code_variable="";
		ArrayList<size> sizeList = new ArrayList<size>();
		
		/*split the lines*/
		String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            System.out.println("line " + count++ + " : " + line);
            String[] findString  = line.split("\"");
            
            /*Initializing the parameters*/
            int keyword=0;
    		int Numerical=0;
    		int stringCount = 0;
    		int identifier = 0;
    		int operator=0;
            
            for (int i=1;i<=findString.length;i++) {
        		
            	if(i%2==1) {
            		
            		String test =findString[i-1];
            		
					/* initializing the key word */
            		String regex = "abstract_|boolean_|break_|byte_|case_|catch_|char_|class_|continue_|default_|do_|double_|else_|enum_|extends_|final_|finally_|float_|for_|if_|implements_|instanceof_|interface_|long_|new_|null_|package_|private_|protected_|public_|return_|short_|String_|static_|strictfp_|super_|switch_|synchronized_|this_|throw_|throws_|transient_|try_|void_|volatile_|while_"; 
            		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
            		Matcher matcher = pattern.matcher(test.replaceAll("\\s+","_"));
            		while (matcher.find())
            		{
            			keyword++;
            		}
            		
            		/* initializing the Numerical */
            		String str = test.replaceAll("\\d+", "_X@X_");
            		
            		String regex1 = "_X@X_";
            		Pattern pattern1 = Pattern.compile(regex1, Pattern.CASE_INSENSITIVE);
            		Matcher matcher1 = pattern1.matcher(str);
            		while (matcher1.find())
            		{
            			Numerical++;
            		}
            		
            		/* initializing the data types */
            		String regex2 = "boolean|byte|char|double|float|int|long|short|String|Dimension"; 
            		Pattern pattern2 = Pattern.compile(regex2, Pattern.CASE_INSENSITIVE);
            		Matcher matcher2 = pattern2.matcher(test);
            		while (matcher2.find())
            		{
            			int first=0;
            			String regex3 = ";"; 
                		Pattern pattern3 = Pattern.compile(regex3, Pattern.CASE_INSENSITIVE);
                		Matcher matcher3 = pattern3.matcher(test);
                		while (matcher3.find())
                		{
                			if(first==0) {
                    			String line_var= test.substring(matcher2.end(),matcher3.start());
                    			String[] var_arr  = line_var.split("=\\,\\;");
                    			for(int k = 0; k < var_arr.length; k++) {
                    				String[] var_arr1  = line_var.split(",");
                    				for(int m = 0; m < var_arr1.length; m++) {
                    					String test_var =var_arr1[m];
                    					String[] test_arr  = test_var.split("=");
                    					test_arr[0]=test_arr[0].replaceAll("\\s+","");
                    					if(code_variable=="") {
                    						
                    						boolean suc=true;
                    						
                    						String str4 = (test_arr[0].replaceAll("\\(", "_X@X_")).replaceAll("\\)", "_X@X_");
                    						
                    						String regex4 = "_X@X_"; 
                    	            		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                    	            		Matcher matcher4 = pattern4.matcher(str4);
                    	            		while (matcher4.find())
                    	            		{
                    	            			suc=false;
                    	            		}
                    	            		
                    	            		if(suc) {
                    	            			code_variable =test_arr[0]+"=|"+test_arr[0]+"<|"+test_arr[0]+".XX-X.|="+test_arr[0]+"|<"+test_arr[0]+"|.X-X."+test_arr[0]+"|"+test_arr[0]+".X-X.|-"+test_arr[0]+"|"+test_arr[0]+"-|.X-X-X."+test_arr[0]+"|"+test_arr[0]+".X-X-X.|/"+test_arr[0]+"|"+test_arr[0]+"/|%"+test_arr[0]+"|"+test_arr[0]+"%";
                    	            		}
                    					}else {
                							boolean suc=true;
                    						
                    						String str4 = (test_arr[0].replaceAll("\\(", "_X@X_")).replaceAll("\\)", "_X@X_");
                    						
                    						String regex4 = "_X@X_"; 
                    	            		Pattern pattern4 = Pattern.compile(regex4, Pattern.CASE_INSENSITIVE);
                    	            		Matcher matcher4 = pattern4.matcher(str4);
                    	            		while (matcher4.find())
                    	            		{
                    	            			suc=false;
                    	            		}
                    	            		
                    	            		if(suc) {
                    	            			code_variable = code_variable+"|"+test_arr[0]+"=|"+test_arr[0]+"<|"+test_arr[0]+".XX-X.|="+test_arr[0]+"|<"+test_arr[0]+"|.X-X."+test_arr[0]+"|"+test_arr[0]+".X-X.|-"+test_arr[0]+"|"+test_arr[0]+"-|.X-X-X."+test_arr[0]+"|"+test_arr[0]+".X-X-X.|/"+test_arr[0]+"|"+test_arr[0]+"/|%"+test_arr[0]+"|"+test_arr[0]+"%";
                    	            		}
                        					
                    					}
                    				}
                                }
                			}
                			first++;
                		}
            		}
            		
					/* initializing the identifier */
            		if(code_variable!="") {
            			String str1= test.replaceAll("\\s+","");
            			String str2= str1.replaceAll("\\+",".X-X.");
            			String str3= str2.replaceAll("\\*",".X-X-X.");
            			String str4= str3.replaceAll("\\)",".XX-X.");
            			String regex5 = code_variable; 
	            		Pattern pattern5 = Pattern.compile(regex5, Pattern.CASE_INSENSITIVE);
	            		Matcher matcher5 = pattern5.matcher(str4);
	            		while (matcher5.find())
	            		{
	            			identifier++;
	            		}
            		}
            		
            		String str1= test.replaceAll("\\s+","_");
            		String regex6 = "class_|interface_|void_"; 
            		Pattern pattern6 = Pattern.compile(regex6, Pattern.CASE_INSENSITIVE);
            		Matcher matcher6 = pattern6.matcher(str1);
            		while (matcher6.find())
            		{
            			identifier++;
            			
            			int x=0,y=0;
            			
                		String regex7 = ","; 
                		Pattern pattern7 = Pattern.compile(regex7, Pattern.CASE_INSENSITIVE);
                		Matcher matcher7 = pattern7.matcher(test);
                		while (matcher7.find())
                		{
                			x++;
                		}
                		
                		String regex8 = ","; 
                		Pattern pattern8 = Pattern.compile(regex8, Pattern.CASE_INSENSITIVE);
                		Matcher matcher8 = pattern8.matcher(test);
                		while (matcher8.find())
                		{
                			y++;
                		}
            			
                		if(x>0) {
                			identifier=identifier+x+1;
                		}
                		
                		if(y>0) {
                			identifier=identifier+y+1;
                		}
                		
            		}
            		
            		boolean imp=true;
            		
            		
            		/*Initializing the Operators*/
            		String regex7 = "import_"; 
            		Pattern pattern7 = Pattern.compile(regex7, Pattern.CASE_INSENSITIVE);
            		Matcher matcher7 = pattern7.matcher(str1);
            		while (matcher7.find())
            		{
            			imp=false;
            		}
            		
            		if(imp) {
	            		String test1= test.replaceAll("\\*;","");
	            		String test2= test1.replaceAll("\\.",".@-1@1.");
	            		String strr1= test2.replaceAll("\\|=",".@-1@1.");
	            		String str2= strr1.replaceAll("\\|","@");
	            		String str3= str2.replaceAll("\\!=",".@-1@1.");
	            		String str4= str3.replaceAll("\\>=",".@-1@1.");
	            		String str5= str4.replaceAll("\\<=",".@-1@1.");
	            		String str6= str5.replaceAll("\\==",".@-1@1.");
	            		String str7= str6.replaceAll("\\++",".@-1@1.");
	            		String str8= str7.replaceAll("\\--",".@-1@1.");
	            		String str9= str8.replaceAll("\\<<<",".@-1@1.");
	            		String str10= str9.replaceAll("\\>>>",".@-1@1.");
	            		String str11= str10.replaceAll("\\>>",".@-1@1.");
	            		String str12= str11.replaceAll("\\<<",".@-1@1.");
	            		String str13= str12.replaceAll("\\~",".@-1@1.");
	            		String str14= str13.replaceAll("\\^",".@-1@1.");
	            		String str15= str14.replaceAll("\\->",".@-1@1.");
	            		String str16= str15.replaceAll("\\::",".@-1@1.");
	            		String str17= str16.replaceAll("\\+=",".@-1@1.");
	            		String str18= str17.replaceAll("\\-=",".@-1@1.");
	            		String str19= str18.replaceAll("\\*=",".@-1@1.");
	            		String str20= str19.replaceAll("\\/=",".@-1@1.");
	            		String str21= str20.replaceAll("\\>>>=",".@-1@1.");
	            		String str22= str21.replaceAll("\\&=",".@-1@1.");
	            		String str23= str22.replaceAll("\\%=",".@-1@1.");
	            		String str24= str23.replaceAll("\\<<=",".@-1@1.");
	            		String str25= str24.replaceAll("\\>>=",".@-1@1.");
	            		String str26= str25.replaceAll("\\^=",".@-1@1.");
	            		String str27= str26.replaceAll("\\+",".@-1@1.");
	            		String str28= str27.replaceAll("\\-",".@-1@1.");
	            		String str29= str28.replaceAll("\\*",".@-1@1.");
	            		String str30= str29.replaceAll("\\/",".@-1@1.");
	            		String str31= str30.replaceAll("\\%",".@-1@1.");
	            		String str32= str31.replaceAll("\\=",".@-1@1.");
	            		String str33= str32.replaceAll("\\,",".@-1@1.");
	            		String regex8 = "&&|@@|.@-1@1.";
	            		Pattern pattern8 = Pattern.compile(regex8, Pattern.CASE_INSENSITIVE);
	            		Matcher matcher8 = pattern8.matcher(str33);
	            		while (matcher8.find())
	            		{
	            			operator++;
	            		}
            		}
            		
            	}else {
            		/*get the   */
            		String string = findString[i-1];
            		for(int k = 0; k < string.length(); k++) {    
                        if(string.charAt(k) != ' ')    
                        	stringCount++;    
                    }
            		stringCount = stringCount + string.replaceAll("[^ ]", "").length();
            	}
            }
            
            size list = new size();
            
            list.setIdentifier(identifier);
            list.setKeyword(keyword);
            list.setLine(line);
            list.setLineNumber(count);
            list.setNumerical(Numerical);
            list.setOperator(operator);
            list.setStringCount(stringCount);
            
            sizeList.add(list);
            
            System.out.println(" ind "+identifier+" key "+keyword+" n "+Numerical+" op "+operator);
            
        }
		
        return sizeList;
        
	}

}

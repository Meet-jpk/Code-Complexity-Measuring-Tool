package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class InheritanceService {

	public ArrayList<Inheritance> test(String code) {
		
        int count = 0;
        int classCount=0;
        ArrayList<Inheritance> list = new ArrayList<Inheritance>();

        String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            count++;
            String[] code_line_string  = line.split("\"");
            String className=null;
            int direct=0;
            int indirect=0;
            
            for (int i=1;i<=code_line_string.length;i++) {
        		
            	if(i%2==1) {
            		
                    String test =code_line_string[i-1];

                    String str= test.replaceAll("\\s+","_");

                    String reg_ptr = "class_"; 
                    Pattern pattern = Pattern.compile(reg_ptr, Pattern.CASE_INSENSITIVE);
                    Matcher matcher = pattern.matcher(str);
                    while (matcher.find())
                    {
                            boolean ex=false;

                            String reg_ptr1 = "_extends_"; 
                            Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                            Matcher mtr1 = ptrn1.matcher(str);
                            while (mtr1.find())
                            {

                                ex=true;
                                String clsName = test.substring(matcher.end(),mtr1.start());

                                className=clsName.replaceAll("\\s+","");
                                
                                String reg_ptr4 = "_implements_"; 
                                Pattern ptrn4 = Pattern.compile(reg_ptr4, Pattern.CASE_INSENSITIVE);
                                Matcher mtr4 = ptrn4.matcher(str);
                                while (mtr4.find())
                                {
                                	boolean check=false;
                                	String testClass = test.substring(mtr1.end(),mtr4.start());
                                	
                                	String reg_ptr5 = "."; 
                                    Pattern ptrn5 = Pattern.compile(reg_ptr5, Pattern.CASE_INSENSITIVE);
                                    Matcher mtr5 = ptrn5.matcher(testClass);
                                    while (mtr5.find())
                                    {
                                    	check=true;
                                    }
                                    
                                    if(check) {
                                    	direct--;
                                    }
                                }
                                direct++;

                                String smpl_str1= str.replaceAll("\\{","@");

                                String reg_ptr2 = "_@|@"; 
                                Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                                Matcher mtr2 = ptrn2.matcher(smpl_str1);
                                while (mtr2.find())
                                {

                                        String extName = (test.substring(mtr1.end(),mtr2.start())).replaceAll("\\s+","");

                                        indirect=loops_Counting(code,extName,0);

                                }

                            }

                            if(ex==false) {

                                String smpl_str1= str.replaceAll("\\{","@");

                                String reg_ptr2 = "_@|@"; 
                                Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                                Matcher mtr2 = ptrn2.matcher(smpl_str1);
                                while (mtr2.find())
                                {
                                        String clsName = test.substring(matcher.end(),mtr2.start());

                                        className=clsName.replaceAll("\\s+","");

                                }
                            }
                    classCount++;
                    Inheritance inheritance = new Inheritance();

                    inheritance.setLineNumber(classCount);
                    inheritance.setClassName(className);
                    inheritance.setDirect(direct);
                    inheritance.setIndirect(indirect);

                    list.add(inheritance);

                    }
            		
            	}
            }
        }
		
        return list;
		
    }
	
    private int loops_Counting(String code,String ext,int indirect) {

        int count = 0;

        String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            count++;
            String[] code_line_string  = line.split("\"");

            for (int i=1;i<=code_line_string.length;i++) {

                if(i%2==1) {

                    String test =code_line_string[i-1];

                    String str= test.replaceAll("\\s+","");

                    String reg_ptr = "class"+ext; 
                    Pattern pattern = Pattern.compile(reg_ptr, Pattern.CASE_INSENSITIVE);
                    Matcher matcher = pattern.matcher(str);
                    while (matcher.find())
                    {
                            boolean ex=false;

                            String smpl_str1= test.replaceAll("\\s+","_");
                            String reg_ptr1 = "_extends_"; 
                            Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                            Matcher mtr1 = ptrn1.matcher(smpl_str1);
                            while (mtr1.find())
                            {
                                    ex=true;

                                    String smpl_str2= smpl_str1.replaceAll("\\{","@");

                                    String reg_ptr2 = "_@|@"; 
                            Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                            Matcher mtr2 = ptrn2.matcher(smpl_str2);
                            while (mtr2.find())
                            {

                                    String extName = (test.substring(mtr1.end(),mtr2.start())).replaceAll("\\s+","");

                                    indirect++;

                                    return loops_Counting(code,extName,indirect);

                            }
                            }

                            if(ex==false) {

                                    return indirect;

                            }

                    }

                }
            }
        }
        return indirect;
    }
	
}

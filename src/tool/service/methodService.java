package tool.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tool.model.*;

public class methodService {

	public ArrayList<Methods> test(String code) {
		
        int count = 0;
        ArrayList<Methods> list = new ArrayList<Methods>();
		
        String[] lines = code.split("\\r?\\n");
        for (String line : lines) {
            count++;
            String[] code_line_string  = line.split("\"");
            int primitive_Methods=0;
            int composite_Methods=0;
            int primitive_Parameters=0;
            int composite_Parameters=0;
            
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
                            String smpl_str3= smpl_str2.replaceAll("\\{","._@1");

                            String reg_ptr1 = "@._@1"; 
                            Pattern ptrn1 = Pattern.compile(reg_ptr1, Pattern.CASE_INSENSITIVE);
                            Matcher mtr1 = ptrn1.matcher(smpl_str3);
                            while (mtr1.find())
                            {
                                boolean type=false;

                                String reg_ptr2 = "_void_"; 
                                Pattern ptrn2 = Pattern.compile(reg_ptr2, Pattern.CASE_INSENSITIVE);
                                Matcher mtr2 = ptrn2.matcher(str);
                                while (mtr2.find())
                                {
                                        type=true;
                                }
                                if(!type) {

                                        String smpl_str4= test.replaceAll("\\(","@@");
                                        String[] sample  = smpl_str4.split("@@");

                                        String smpl_str5= sample[0].replaceAll("\\s+","_");
                                        String reg_ptr3 = "_boolean_|_byte_|_char_|_double_|_float_|_int_|_long_|_short_|_String_"; 
                                        Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                                        Matcher mtr3 = ptrn3.matcher(smpl_str5);
                                        while (mtr3.find())
                                        {
                                                primitive_Methods++;
                                        }

                                        if(primitive_Methods==0) {
                                                composite_Methods++;
                                        }

                                        int data_types=0;

                                        String smpl_str6= sample[1].replaceAll("\\s+","_");
                                        String reg_ptr4 = "boolean_|byte_|char_|double_|float_|int_|long_|short_|String_"; 
                                        Pattern ptrn4 = Pattern.compile(reg_ptr4, Pattern.CASE_INSENSITIVE);
                                        Matcher mtr4 = ptrn4.matcher(smpl_str6);
                                        while (mtr4.find())
                                        {
                                                data_types++;
                                        }

                                        int parameters=1;

                                        String reg_ptr5 = ","; 
                                        Pattern ptrn5 = Pattern.compile(reg_ptr5, Pattern.CASE_INSENSITIVE);
                                        Matcher mtr5 = ptrn5.matcher(sample[1]);
                                        while (mtr5.find())
                                        {
                                                parameters++;
                                        }

                                        int no_para=0;

                                        String smpl_str7= sample[1].replaceAll("\\s+","");
                                        String smpl_str8= smpl_str7.replaceAll("\\)","@");
                                        String reg_ptr6 = "@@"; 
                                        Pattern ptrn6 = Pattern.compile(reg_ptr6, Pattern.CASE_INSENSITIVE);
                                        Matcher mtr6 = ptrn6.matcher("@"+smpl_str8);
                                        while (mtr6.find())
                                        {
                                                no_para++;
                                        }

                                        int comp=0;

                                        String smpl_str9= sample[1].replaceAll("\\[","@@");
                                        String reg_ptr9 = "@@"; 
                                        Pattern pattern9 = Pattern.compile(reg_ptr9, Pattern.CASE_INSENSITIVE);
                                        Matcher matcher9 = ptrn6.matcher(smpl_str9);
                                        while (matcher9.find())
                                        {
                                                comp++;
                                        }

                                        if(no_para!=0) {
                                                primitive_Parameters=0;
                                                composite_Parameters=0;
                                        }else if((data_types==parameters)&&comp==0){
                                                primitive_Parameters=data_types;
                                                composite_Parameters=0;
                                        }else if((data_types!=parameters)&&comp==0){
                                                primitive_Parameters=data_types;
                                                composite_Parameters=parameters-data_types;
                                        }else if((comp==parameters)&&data_types!=0){
                                                primitive_Parameters=0;
                                                composite_Parameters=parameters;
                                        }else{
                                                primitive_Parameters=data_types;
                                                composite_Parameters=parameters;
                                        }

                                }else {
                                	String smpl_str4= test.replaceAll("\\(","@@");
                                    String[] sample  = smpl_str4.split("@@");

                                    String smpl_str5= sample[1].replaceAll("\\s+","_");
                                    String reg_ptr3 = "Graphics_|MouseEvent_"; 
                                    Pattern ptrn3 = Pattern.compile(reg_ptr3, Pattern.CASE_INSENSITIVE);
                                    Matcher mtr3 = ptrn3.matcher(smpl_str5);
                                    while (mtr3.find())
                                    {
                                    	composite_Parameters++;
                                    }
                                }
                            }
                    }
            	}
            }
            Methods method = new Methods();
            
            method.setLine(line);
            method.setLineNumber(count);
            method.setComposite_method(composite_Methods);
            method.setComposite_parameters(composite_Parameters);
            method.setPrimitive_method(primitive_Methods);
            method.setPrimitive_parameters(primitive_Parameters);

            list.add(method);
        }
        return list;
    }
	
}

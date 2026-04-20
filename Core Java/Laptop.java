import java.lang.reflect.Method;
import java.io.*;
import java.util.*;

public class Laptop {
	
	int price;
	String details;
	public Laptop(String details, int price) {
		super();
		this.price = price;
		this.details = details;
	}
}
	
	class Afford{
		public String checkConfiguration(Laptop laptop) throws LaptopException{
			if(laptop.price > 70000) {
				throw new LaptopException("Price too High");
			}
			else if (Integer.parseInt(laptop.details) < 8) {
				throw new LaptopException("Minimum 8GB required");
			}
			else if(laptop.details == "8/512/HDD" ) {
				throw new LaptopException("SSD required");
			}
			return "Can be purchased";
			
		}
		
		public String purchaseLaptop(Laptop laptop) throws Exception{
			try {
				if(checkConfiguration(laptop).equals("configuration")) {
					return "Perfect Configuration";
				}
				else {
					return "Change configuration";				}
			}
			catch(Exception e) {
				return "Other Exception";
			}
		}
	}



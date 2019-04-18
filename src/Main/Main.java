package Main;
import java.util.*;

public class Main {
	
	public static void main (String[] args) {
		
		 Scanner sn = new Scanner(System.in);
	       boolean salir = false;
	       int opcion; 
	        
	       while(!salir){
	    	   
	    	   System.out.println("-----------------------");
	           System.out.println("Nana's Rent a Car");
	           System.out.println("-----------------------"); 
	           
	           System.out.println("Elija una opcion del menu");
	         
	    	   
	           System.out.println("1.Crear ");
	           System.out.println("2. Ver");
	           System.out.println("3. Actualizar");
	           System.out.println("4. Salir");
	            
	           System.out.println("Escribe una de las opciones");
	           opcion = sn.nextInt();
	            
	           switch(opcion){
	               case 1:
	            	   int op1 = 0;
	            	   do {
	       				System.out.println(" Ingreso a su Cuenta Corrinete");
	       				System.out.println(" Que va a Realizar...");
	       				System.out.println("\n 1.Crer cliente.");
	       				System.out.println("\n 2.Crear Reserva");
	       				System.out.println("\n 3.Crear Alquiler.");
	       				System.out.println("\n 4.Crear Alquiler.");
	       				System.out.println("\n 5. volver Atras.");
	       				op1 = sn.nextInt();
	       			switch (op1){
	       			case 1: System.out.println("Selecciono Abonar."); break;
	       			case 2: System.out.println("Selecciono Cargar."); break;
	       			case 3: System.out.println("Selecciono Mostrar Saldo."); break ;
	       			case 4: System.out.println("Selecciono Mostrar Saldo."); break ;
	       			default: System.out.println("Selecciono Volver Atras.");
	       			}
	        
	       }while (op1<4) ;
	                   break;
	               case 2:
	            	   int op2 = 0;
	            	   do {
	       				System.out.println(" Ingreso a su Cuenta Corrinete");
	       				System.out.println(" Que va a Realizar...");
	       				System.out.println("\n 1.Abonar.");
	       				System.out.println("\n 2.Cargar");
	       				System.out.println("\n 3.Mostrar Saldo.");
	       				System.out.println("\n 4. volver Atras.");
	       				op2 = sn.nextInt();
	       			switch (op2){
	       			case 1: System.out.println("Selecciono Abonar."); break;
	       			case 2: System.out.println("Selecciono Cargar."); break;
	       			case 3: System.out.println("Selecciono Mostrar Saldo."); break ;
	       			default: System.out.println("Selecciono Volver Atras.");
	       			}
	        
	       }while (op2<3) ;
	                   break;
	                case 3:
	                	int op3 = 0;
		            	   do {
		       				System.out.println(" Ingreso a su Cuenta Corrinete");
		       				System.out.println(" Que va a Realizar...");
		       				System.out.println("\n 1.Abonar.");
		       				System.out.println("\n 2.Cargar");
		       				System.out.println("\n 3.Mostrar Saldo.");
		       				System.out.println("\n 4. volver Atras.");
		       				op3 = sn.nextInt();
		       			switch (op3){
		       			case 1: System.out.println("Selecciono Abonar."); break;
		       			case 2: System.out.println("Selecciono Cargar."); break;
		       			case 3: System.out.println("Selecciono Mostrar Saldo."); break ;
		       			default: System.out.println("Selecciono Volver Atras.");
		       			}
		        
		       }while (op3<3) ;
	                	break;
	                case 4:
	                   salir=true;
	                   break;
	                default:
	                   System.out.println("Solo números entre 1 y 4");
	           }
	            
	       }
	        
	    }
	}



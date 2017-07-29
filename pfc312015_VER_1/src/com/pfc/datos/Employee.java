package com.pfc.datos;

import com.google.appengine.api.datastore.Key;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class Employee {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

    @Persistent
    private String firstName;

    @Persistent
    private String lastName;

    @Persistent
    private Date hireDate;

    
    
    /*Se ha añadido el atributo despues y ha funcionado todo ok*/
    @Persistent
    private int n;
    
    private static int tot=0; //igual tiene ser lamacenado en el local del cliente.....
 /*empieza a numerar otra vez desde 0 habra que hacer lo de local */
    
    
    public Employee(String firstName, String lastName, Date hireDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.hireDate = hireDate;
        n=tot++;
    }
    
    
    
    



	// Accessors for the fields. JDO doesn't use these, but your application does.

    public Key getKey() {
        return key;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getHireDate() {
        return hireDate;
    }
    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    
    
	public int getN() {
		return n;
	}







	public void setN(int n) {
		this.n = n;
	}







	@Override
	public String toString() {
		return "Employee [firstName=" + firstName + ", lastName=" + lastName
				+ ", hireDate=" + hireDate + "-"+n+"-"+"]";
	}
    
    
}
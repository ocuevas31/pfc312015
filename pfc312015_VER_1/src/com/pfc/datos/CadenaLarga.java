package com.pfc.datos;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class CadenaLarga 
{
	
	
	 @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;

	
	@Persistent
	private List<String> texto;
	
	
	
	private  int TAMTROZOS=1000;
	
	
	
	public CadenaLarga(String c)
	
	{
			texto=trocear(c);
	}
	
	
	
	public CadenaLarga(String c, int tam)
	
	{		
		TAMTROZOS=tam;
		texto=trocear(c);
	}
	
	
	public List<String> trocear(String c)
	{
		List<String> x=new ArrayList<String>();
		
		/* numero de trozos=longitud div tamtrozo   y el ultimo trozo del tamaño del resto de la div*/
		
		int tamTotal=c.length();
		int numTrozos=tamTotal/TAMTROZOS;
		int resto= tamTotal%TAMTROZOS;

		
		/* cada trozo meterlo en la lista posini posfin*/
		/*y si solo hay un trozo*/
		int posini,posfin;
		posini=0;
		posfin=TAMTROZOS;
		
		if (numTrozos==0) {
			posfin=c.length();
			x.add(c.substring(posini, posfin));
		}
		else
		{
			for(int i=0;i<numTrozos;i++)
			{
				//System.out.println(posini+" "+posfin);
				if (posfin==tamTotal) posfin--;
				x.add(c.substring(posini, posfin+1));
				posini=posfin+1;
				posfin+=TAMTROZOS;
			}
			
			if (resto!=0 ) x.add(c.substring(posini,c.length()));
		}
		
		
		
		
		
		
		return x;
		
		
	}

	@Override
	public String toString() {
		String c="";
		for(String k:texto)
		{	
			c+=k;	
		}
		return c;
	}


	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		
		
		String cad=" Don't damn me When I speak a piece of my mind 'Cause silence isn't golden When I'm holding it inside 'Cause I've been where I have been An I've seen what I have seen I put the pen to the paper 'Cause it's all a part of me Be it a song or casual conversation To hold my tongue speaks Of quiet reservations Your words once heard They can place you in a faction My words may disturb But at least there's a reaction Sometimes I wanna kill Sometimes I wanna die Sometimes I wanna destroy Sometimes I wanna cry Sometimes I could get even Sometimes I could give up Sometimes I could give Sometimes I never give a fuck It's only for a while I hope you understand I never wanted this to happen Didn't want to be a man So I hid inside my world I took what I could find I cried when I was lonely I fell down when I was blind But don't damn me When I speak a piece of my mind 'Cause silence isn't golden When I'm holding it inside 'Cause I've been where I have been An I've seen what I have seen I put the pen to the paper 'Cause it's all a part of me How can I ever satisfy you An how can I ever make you see That deep inside we're all somebody An it don't matter who you wanna be But now I gotta smile I hope you comprehend For this man can say it happened 'Cause this child has been condemned So I stepped into your world I kicked you in the mind An I'm the only witness To the nature of my crime";
		
		
		//cad="Hola";
		System.out.println(cad.length());
		
		
		
		for (int i=1;i<1500;i++)
		{
		CadenaLarga y=new CadenaLarga(cad,i);
		
		System.out.println(i+"----------------------------------");
		System.out.println(y.toString());
		}
		

	}

}

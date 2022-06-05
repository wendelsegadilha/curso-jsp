package dao;

public class teste {

	public static void main(String[] args) {
		
		
		Double cadastro = 5.0;
		
		Double porpagina = 5.0;
		
		Double pagina = cadastro / porpagina;
		
		Double resto = pagina % 2;
		
		System.out.println(resto);
		
		if (resto > 0)
			pagina++;
		
		
		System.out.println(pagina.intValue());

	}

}

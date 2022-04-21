package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter("/principal/*") /* Intercepta as requisi��es */
public class FilterAutenticacao implements Filter {

	public FilterAutenticacao() {
	}

	/* Encerra processos quando o servidor � parado */
	public void destroy() {
	}

	/* Intercepta as requisi��es e redireciona as respostas do sistema */
	/* Valida��o de autentica��o */
	/* Commit e Rolback no banco de dados */
	/* Redirecionamentos de p�ginas */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		HttpSession session = req.getSession();

		String usuarioLogado = (String) session.getAttribute("usuario");

		String urlParaAutenticar = req.getServletPath(); /* URL que est� sendo acessada */

		/* Valida se o usu�rio est� logado, se n�o estiver, redireciona para o login */
		if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) { /* N�o logado */

			RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
			request.setAttribute("msg", "Por favor efetue o login!");
			redireciona.forward(request, response);
			return; /* Para a execu��o e redireciona para o login */

		} else {
			chain.doFilter(request, response);
		}

	}

	/* Inicia processos quando o servidor inicia o projeto */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}

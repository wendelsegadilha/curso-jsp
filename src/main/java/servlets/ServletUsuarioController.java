package servlets;

import java.io.IOException;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.ModelLogin;

@MultipartConfig
@WebServlet(urlPatterns =  {"/ServletUsuarioController"})
public class ServletUsuarioController extends ServletGenericUtil {

	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
 
	public ServletUsuarioController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			
			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUser(idUser);
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				
				request.setAttribute("msg", "Ok! excluído com sucesso!");
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUser(idUser);
				
				response.getWriter().write("Ok! excluído com sucesso!");
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {
				
				String nomeBusca = request.getParameter("nomeBusca");
				List<ModelLogin> usuarios = daoUsuarioRepository.consultausuarioList(nomeBusca, super.getUserLogado(request));
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(usuarios);
				response.getWriter().write(json);
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				String id = request.getParameter("id");
				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(id, super.getUserLogado(request));
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				
				request.setAttribute("msg", "Usuário em edição");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
				request.setAttribute("msg", "Usuários carregados");
				request.setAttribute("modelLogins", modelLogins);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);				
			} 
			else {
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String msg = "Ok! gravado com sucesso.";

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String perfil = request.getParameter("perfil");
			String sexo = request.getParameter("sexo");

			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			
			if (ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("fileFoto"); // pega a foto da tela
				byte[] fotoArrayBytes = IOUtils.toByteArray(part.getInputStream());
				
				@SuppressWarnings("static-access")
				String imagemBase64 = new Base64().encodeBase64String(fotoArrayBytes);
				System.out.println(imagemBase64);
			}
			

			if (daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Já existe um usuário com o mesmo login, informe outro!";
			} else {
				if (!modelLogin.isNovo()) {
					msg = "Ok! atualizado com sucesso!";
				}
				modelLogin = daoUsuarioRepository.gravaUsuario(modelLogin, super.getUserLogado(request));
			}
			
			List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
			request.setAttribute("modelLogins", modelLogins);
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

}

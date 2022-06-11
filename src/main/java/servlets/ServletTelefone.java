package servlets;

import java.io.IOException;
import java.util.List;

import dao.DAOTelefoneRepository;
import dao.DAOUsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;
import model.ModelTelefone;

@WebServlet("/ServletTelefone")
public class ServletTelefone extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository;
	private DAOTelefoneRepository daoTelefoneRepository;

	public ServletTelefone() {
		daoUsuarioRepository = new DAOUsuarioRepository();
		daoTelefoneRepository = new DAOTelefoneRepository();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("excluir")) {
				String id = request.getParameter("id");
				String iduser = request.getParameter("iduser");

				daoTelefoneRepository.deleteTelefone(Long.parseLong(id));

				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(Long.valueOf(iduser));

				List<ModelTelefone> modelTelefones = daoTelefoneRepository.listaTelefone(modelLogin.getId());

				request.setAttribute("modelTelefones", modelTelefones);
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);
				
				return;

			}

			String iduser = request.getParameter("iduser");
			if (iduser != null && !iduser.isEmpty()) {

				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(Long.valueOf(iduser));

				List<ModelTelefone> modelTelefones = daoTelefoneRepository.listaTelefone(modelLogin.getId());

				request.setAttribute("modelTelefones", modelTelefones);
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);
			} else {
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultausuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(super.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String usuario_pai_id = request.getParameter("id");
			String numero = request.getParameter("numero");

			ModelTelefone modelTelefone = new ModelTelefone();
			ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(Long.parseLong(usuario_pai_id));
			modelTelefone.setNumero(numero);
			modelTelefone.setUsuario_pai_id(modelLogin);
			modelTelefone.setUsuario_cad_id(super.getUserLogadoObj(request));

			daoTelefoneRepository.gravaTelefone(modelTelefone);

			List<ModelTelefone> modelTelefones = daoTelefoneRepository.listaTelefone(Long.parseLong(usuario_pai_id));

			request.setAttribute("modelLogin", modelLogin);
			request.setAttribute("modelTelefones", modelTelefones);
			request.setAttribute("msg", "Ok! salvo com sucesso!");
			request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

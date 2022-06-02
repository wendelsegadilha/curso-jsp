package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin gravaUsuario(ModelLogin objeto) throws SQLException {

		if (objeto.isNovo()) {
			String sql = "INSERT INTO model_login(login, senha, nome, email) VALUES (?, ?, ?, ?)";

			PreparedStatement preparedSql = connection.prepareStatement(sql);

			preparedSql.setString(1, objeto.getLogin());
			preparedSql.setString(2, objeto.getSenha());
			preparedSql.setString(3, objeto.getNome());
			preparedSql.setString(4, objeto.getEmail());

			preparedSql.execute();
			connection.commit();
		} else {
			String sql = "UPDATE model_login SET login=?, senha=?, nome=?, email=? WHERE id = " + objeto.getId();

			PreparedStatement preparedSql = connection.prepareStatement(sql);

			preparedSql.setString(1, objeto.getLogin());
			preparedSql.setString(2, objeto.getSenha());
			preparedSql.setString(3, objeto.getNome());
			preparedSql.setString(4, objeto.getEmail());

			preparedSql.executeUpdate();
			connection.commit();
		}

		return consultaUsuario(objeto.getLogin());
	}
	
public List<ModelLogin> consultausuarioList() throws Exception {
		
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();
		
		String sql = "select * from model_login where useradmin is false";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			retorno.add(modelLogin);
		}
		
		return retorno;
	}
	
	public List<ModelLogin> consultausuarioList(String nome) throws Exception {
		
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();
		
		String sql = "select * from model_login where upper(nome) like upper(?) and useradmin is false";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, "%"+nome+"%");
		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			retorno.add(modelLogin);
		}
		
		return retorno;
	}

	public ModelLogin consultaUsuario(String login) throws SQLException {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE upper(login) = upper('" + login + "') and useradmin is false";

		PreparedStatement preparedSql = connection.prepareStatement(sql);

		ResultSet resultado = preparedSql.executeQuery();

		while (resultado.next()) {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
		}

		return modelLogin;

	}

	public boolean validarLogin(String login) throws Exception {

		String sql = "select count(1) > 0 as existe from model_login where upper(login) = upper('" + login + "')";

		PreparedStatement preparedSql = connection.prepareStatement(sql);

		ResultSet resultado = preparedSql.executeQuery();
		resultado.next(); /* Avan�a para o resultado */
		return resultado.getBoolean("existe");
	}

	public void deletarUser(String idUser) throws Exception {
		String sql = "DELETE FROM model_login WHERE id = ? and useradmin is false";
		
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setLong(1, Long.parseLong(idUser));
		preparedSql.execute();
		
		connection.commit();
	}

	public ModelLogin consultarUsuarioId(String id) throws Exception {
		
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE id = ? and useradmin is false";

		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setLong(1, Long.valueOf(id));

		ResultSet resultado = preparedSql.executeQuery();

		while (resultado.next()) {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
		}

		return modelLogin;
		
	}

}

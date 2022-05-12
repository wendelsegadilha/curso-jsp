package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin gravaUsuario(ModelLogin objeto) throws SQLException {

		String sql = "INSERT INTO model_login(login, senha, nome, email) VALUES (?, ?, ?, ?)";

		PreparedStatement preparedSql = connection.prepareStatement(sql);

		preparedSql.setString(1, objeto.getLogin());
		preparedSql.setString(2, objeto.getSenha());
		preparedSql.setString(3, objeto.getNome());
		preparedSql.setString(4, objeto.getEmail());

		preparedSql.execute();
		connection.commit();
		
		return consultaUsuario(objeto.getLogin());
	}

	public ModelLogin consultaUsuario(String login) throws SQLException {
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "SELECT * FROM model_login WHERE upper(login) = upper('"+login+"');";

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

}

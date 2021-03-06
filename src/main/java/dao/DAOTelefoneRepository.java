package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelTelefone;

public class DAOTelefoneRepository {

	private Connection connection;
	private DAOUsuarioRepository daoUsuarioRepository;

	public DAOTelefoneRepository() {
		connection = SingleConnectionBanco.getConnection();
		daoUsuarioRepository = new DAOUsuarioRepository();
	}

	public void gravaTelefone(ModelTelefone modelTelefone) throws Exception {

		String sql = "INSERT INTO telefone(numero, usuario_pai_id, usuario_cad_id) VALUES (?, ?, ?)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelTelefone.getNumero());
		preparedStatement.setLong(2, modelTelefone.getUsuario_pai_id().getId());
		preparedStatement.setLong(3, modelTelefone.getUsuario_cad_id().getId());

		preparedStatement.execute();
		connection.commit();

	}

	public List<ModelTelefone> listaTelefone(Long idUserPai) throws Exception{
		
		List<ModelTelefone> retorno = new ArrayList<ModelTelefone>();
		
		String sql = "SELECT * FROM telefone WHERE usuario_pai_id = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, idUserPai);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		while (rs.next()) {
			ModelTelefone modelTelefone = new ModelTelefone();
			modelTelefone.setId(rs.getLong("id"));
			modelTelefone.setNumero(rs.getString("numero"));
			modelTelefone.setUsuario_pai_id(daoUsuarioRepository.consultarUsuarioId(rs.getLong("usuario_pai_id")));
			modelTelefone.setUsuario_cad_id(daoUsuarioRepository.consultarUsuarioId(rs.getLong("usuario_cad_id")));
			
			retorno.add(modelTelefone);
		}
		
		return retorno;
		
	}

	public void deleteTelefone(Long id) throws Exception {

		String sql = "DELETE FROM telefone WHERE id = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, id);

		preparedStatement.executeUpdate();
		connection.commit();

	}

}

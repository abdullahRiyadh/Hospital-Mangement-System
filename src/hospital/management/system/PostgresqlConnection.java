package hospital.management.system;

import java.sql.*;

public class PostgresqlConnection {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/hospital_management";
        String user = "a_r";
        String password = "1234";

        try (Connection conn = DriverManager.getConnection(url, user, password)){
            System.out.println("Connected to PostgreSQL database");
            String createTableSQL= """
                    CREATE TABLE IF NOT EXISTS connection_info (
                    id SERIAL PRIMARY KEY,
                    connected_at TIMESTAMP NOT NULL
                    );
                    """;

                    try(Statement stmt = conn.createStatement()){
                        stmt.execute(createTableSQL);
                        System.out.println("Table exists");

                    }
                    String insertSQL="INSERT INTO connection_info (connected_at) VALUES (?)";
                    try(PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
                        pstmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
                        pstmt.executeUpdate();
                        System.out.println("Inserted Timestamp logged");



                    }


        } catch (SQLException e) {
            System.out.println("could not connect to PostgreSQL database");
            e.printStackTrace();
        }


    }
}

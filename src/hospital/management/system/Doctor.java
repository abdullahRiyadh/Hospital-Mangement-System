package hospital.management.system;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Doctor {
    private Connection conn;


    public Doctor(Connection c ) {
        this.conn=c;


    }
    public void wiewDoctors() {
        String query = "SELECT * FROM doctors";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            System.out.println("Wiew Doctors:");


            System.out.println("+------------+--------------------+------------------+");
            System.out.println("| Doctor Id  | Name               | Specialization   |");
            System.out.println("+------------+--------------------+------------------+");

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String specialization = rs.getString("specialization");
                System.out.printf("| %-10s | %-18s | %-16s |\n", id, name, specialization);
                System.out.println("+------------+--------------------+------------------+");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        public boolean checkDoctor(){
            String query = "SELECT * FROM doctors WHERE id =?";
            try{
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                if (rs.next()){
                    return true;

                }
                else {
                    return false;
                }


            }
            catch (SQLException e){
                e.printStackTrace();
            }

            return false;
        }






}

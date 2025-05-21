package hospital.management.system;

import java.sql.ResultSet;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class patient {

   private  Connection connection;
   private  Scanner scanner;


    public patient(Connection con, String s) {
        this.connection=con;
        this.scanner=s;
    }


    public void addPatient() {
        System.out.println("Enter the name of the patient:");
        String name =scanner.next();
        System.out.println("Enter the age of the patient:");

        int age =scanner.nextInt();
        System.out.println("Enter the gender of the patient:");
        String gender=scanner.next();




        try{
            String query = "INSERT INTO patients(name,age,gender) VALUES(?,?,?)";
            PreparedStatement preparedStatement=connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, age);
            preparedStatement.setString(3, gender);
            int affectedRows=preparedStatement.executeUpdate();
            if(affectedRows>0){
                System.out.println("Patient has been added successfully");
            }else {
                System.out.println("Patient could not be added");
            }


        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void viewPatients() {
        String query = "SELECT * FROM patients;";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println("Patient List: ");
            System.out.println("+------------+--------------------+----------+------------+");
            System.out.println("| Patient Id | Name               | Age      | Gender     |");
            System.out.println("+------------+--------------------+----------+------------+");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                System.out.printf("| %-10s | %-18s | %-8s | %-10s |\n", id, name, age, gender);
                System.out.println("+------------+--------------------+----------+------------+");

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        public Boolean checkPatients(){
        String query = "SELECT * FROM patient WHERE id=?;";
        try {


            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            } else {
                return false;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }










    }






}



/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.*;

public class lab9 {

    ArrayList<EmployeeData> arrayList = new ArrayList<EmployeeData>();
    
    public static void main (String[] args) {
        new lab9().go();
    }

    // This is the function that does all the work
    private void go() {

        // Read pass.dat
        UserPass login = new UserPass();
        String user = login.getUserName();
        String pass = login.getPassWord();
        String host = "silver.otago.ac.nz";
        String sql = "SELECT fname, lname, salary FROM  employee";

        Connection con = null;
        try {
            // Register the driver and connect to Oracle
            DriverManager.registerDriver
                (new oracle.jdbc.driver.OracleDriver());
            String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Connected to Oracle");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                EmployeeData person = new EmployeeData(
                                               rs.getString("fname"),
                                               rs.getString("lname"),
                                               rs.getInt("salary"));
                arrayList.add(person);
            }
            Collections.sort(arrayList);
            System.out.println(arrayList);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.exit(1);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    quit(e.getMessage());
                }
               
            }
        }
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
        System.err.println(message);
        System.exit(1);
    }
}

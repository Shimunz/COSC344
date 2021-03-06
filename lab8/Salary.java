/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

import java.io.*;
import java.util.*;
import java.sql.*;

public class Salary {


    public static void main (String[] args) {
        new Salary().go();
    }

    // This is the function that does all the work
    private void go() {

        // Read pass.dat
	String update = "UPDATE employee SET salary = salary * 1.1";
	String sql = "SELECT * FROM employee";
        UserPass login = new UserPass();
        String user = login.getUserName();
        String pass = login.getPassWord();
        String host = "silver.otago.ac.nz";

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
	    while (rs.next()) {
                System.out.println(rs.getString("fname") + "\t" +
                                   rs.getString("lname") + "\t" +
                                   rs.getString("salary"));
            }
            ResultSet rss = stmt.executeQuery(update);
	    rs = stmt.executeQuery(sql);
	    System.out.println("\n Updating \n");
	    while (rs.next()) {
                System.out.println(rs.getString("fname") + "\t" +
                                   rs.getString("lname") + "\t" +
                                   rs.getString("salary"));
            }
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

} // end class TestLogin

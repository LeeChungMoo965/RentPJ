package dto;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import dao.ConnectionFactory;


public class User extends Car{
    private Connection conn;
    private ArrayList<Car> listofCars = new ArrayList<Car>();

    public User()  throws ClassNotFoundException, SQLException{
        ConnectionFactory con= new ConnectionFactory();
        con.setconnect();
        this.conn = con.getconnect();
    }
   
    public void addCar(Car car){
        try{
            String sql = new StringBuilder()
            .append("INSERT INTO CAR (carid,carname,carprice,people,oil,color,distancy,endtime,starttime,locationX,locationY,filename,releasDate)")
            .append(" VALUES (?,?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD-HH24-MI'),TO_DATE(?,'YYYY-MM-DD-HH24-MI'),?,?,?,SYSDATE)")
            .toString();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, car.getCarid());
            pstmt.setString(2, car.getCarname());
            pstmt.setInt(3, car.getCarprice());
            pstmt.setInt(4, car.getPeople());
            pstmt.setString(5, car.getOil());
            pstmt.setString(6, car.getColor());
            pstmt.setInt(7, car.getDistancy());
            pstmt.setString(8, car.getEndtime());
            pstmt.setString(9, car.getStarttime());
            pstmt.setString(10, car.getLocationX());
            pstmt.setString(11, car.getLocationY());
            pstmt.setString(12, car.getFileName());
            



            
            
            int rows = pstmt.executeUpdate();
            if(rows == 1){
                System.out.println("추가 성공! ");
                conn.commit();
            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
    public ArrayList<Car> getListofCars() {
      
        try{    
            String sql = new StringBuilder()
                .append("SELECT carid,carname,carprice,people,oil,color,distancy,locationX,locationY,filename,releasDate,TO_CHAR(endtime, 'YYYY-MM-DD-HH24-MI') AS etime,TO_CHAR(starttime, 'YYYY-MM-DD-HH24-MI') AS stime")
                .append(" FROM CAR ")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);            
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    Car car = new Car();
                    car.setCarid(rs.getInt("carid"));
                    car.setCarname(rs.getString("carname"));
                    car.setPeople(rs.getInt("people"));
                    car.setCarprice(rs.getInt("carprice"));
                    car.setOil(rs.getString("oil"));
                    car.setColor(rs.getString("color"));
                    car.setFileName(rs.getString("filename"));
                    car.setLocationX(rs.getString("locationX"));
                    car.setLocationY(rs.getString("locationY"));
                    car.setDistancy(rs.getInt("distancy"));
                    car.setEndtime(rs.getString("etime"));
                    car.setStarttime(rs.getString("stime"));
                    listofCars.add(car);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofCars;
    }
    public Car getCarById(int carid){
        Car carById = null;

        

        for( int i =0; i< listofCars.size(); i++){
            Car car= listofCars.get(i);
            if(car!=null && car.getCarid()!= 0 && car.getCarid()==carid){
                carById = car;
                break;
            } 

        }
        return carById;
    }

}

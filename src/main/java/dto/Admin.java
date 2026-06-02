package dto;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import dao.*;


public class Admin extends Car{
    private Connection conn;
    private ArrayList<Car> listofCars = new ArrayList<Car>();
    private ArrayList<Reservation> listofres = new ArrayList<Reservation>();
    private ArrayList<PayInfo> listofpay = new ArrayList<PayInfo>();
    private ArrayList<Member> listofmem = new ArrayList<Member>();
    public Admin()  throws ClassNotFoundException, SQLException{
        ConnectionFactory con= new ConnectionFactory();
        con.setconnect();
        this.conn = con.getconnect();
    }
   
    public boolean addCar(Car car){
        int a =0;
        try{
            String sql = new StringBuilder()
            .append("INSERT INTO CAR (carname,carprice,people,oil,color,distancy,endtime,starttime,locationX,locationY,filename,releasDate)")
            .append(" VALUES (?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD-HH24-MI'),TO_DATE(?,'YYYY-MM-DD-HH24-MI'),?,?,?,SYSDATE)")
            .toString();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, car.getCarname());
            pstmt.setInt(2, car.getCarprice());
            pstmt.setInt(3, car.getPeople());
            pstmt.setString(4, car.getOil());
            pstmt.setString(5, car.getColor());
            pstmt.setInt(6, car.getDistancy());
            pstmt.setString(7, car.getEndtime());
            pstmt.setString(8, car.getStarttime());
            pstmt.setString(9, car.getLocationX());
            pstmt.setString(10, car.getLocationY());
            pstmt.setString(11, car.getFileName());
            
            


            
            
            int rows = pstmt.executeUpdate();
            if(rows == 1){
                System.out.println("추가 성공! ");
                a++;
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
        if(a > 0) {return true;}
            return false;
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
    public boolean deleteMember(String id){
        RemoveMember re = new RemoveMember();
        return re.deleteMember(id);
    }
    public ArrayList<PayInfo> getListofPays() {
      
        try{    
            String sql = new StringBuilder()
                .append("SELECT PAY_NUMBER,carid,id,total_price,TO_CHAR(releasDate,'YYYY-MM-DD') AS rtime")
                .append(" FROM PAY_INFO ")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);            
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    PayInfo pay = new PayInfo();
                    pay.setPay_number(rs.getInt("PAY_NUMBER"));
                    pay.setCarid(rs.getInt("carid"));
                    pay.setId(rs.getString("id"));
                    pay.setReleasDate(rs.getString("rtime"));
                    pay.setTotal_price(rs.getInt("total_price"));
                    listofpay.add(pay);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofpay;
    }
    public ArrayList<Member> getListofMems() {
      
        try{    
            String sql = new StringBuilder()
                .append("SELECT id, password, name, gender, birth, mail, phone, address, TO_CHAR(regist_day, 'YYYY-MM-DD') AS rtime ")
                .append(" FROM MEMBER ")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);            
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    Member member = new Member();
                    member.setId(rs.getString("id"));
                    member.setName(rs.getString("name"));
                    member.setPassword(rs.getString("password"));
                    member.setGender(rs.getString("gender"));
                    member.setBirth(rs.getString("birth"));
                    member.setMail(rs.getString("mail"));
                    member.setPhone(rs.getString("phone"));
                    member.setAddress(rs.getString("address"));
                    member.setRegist_day(rs.getString("rtime"));
                    listofmem.add(member);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofmem;
    }
    public ArrayList<Reservation> getListofRess() {
      
        try{    
            String sql = new StringBuilder()
                .append("SELECT carid, id,")
                .append("TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI') AS stime,")
                .append("TO_CHAR(endtime, 'YYYY-MM-DD HH24:MI') AS etime,")
                .append("TO_CHAR(REGIST_DAY, 'YYYY-MM-DD') AS rtime")
                .append(" FROM RESERVATION ")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);            
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    Reservation res = new Reservation();
                    res.setCarid(rs.getInt("carid"));
                    res.setId(rs.getString("id"));
                    res.setEndtime(rs.getString("etime"));
                    res.setStarttime(rs.getString("stime"));
                    res.setRegist_day(rs.getString("rtime"));
                    listofres.add(res);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofres;
    }
    public ArrayList<Reservation> getListofRes() {
      
        try{    
            String sql = new StringBuilder()
            .append("SELECT id, carid,")
            .append("TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI') AS stime,")
            .append("TO_CHAR(endtime, 'YYYY-MM-DD HH24:MI') AS etime,")
            .append("TO_CHAR(REGIST_DAY, 'YYYY-MM-DD') AS rtime")
            .append("FROM RESERVATION")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);
          
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    Reservation res = new Reservation();
                    res.setRes_num(rs.getInt("reservation_number"));
                    res.setCarid(rs.getInt("carid"));
                    res.setId(rs.getString("id"));
                    res.setEndtime(rs.getString("etime"));
                    res.setStarttime(rs.getString("stime"));
                    res.setRegist_day(rs.getString("rtime"));
                    listofres.add(res);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofres;
    }
    /*
    public ArrayList<PayInfo> getListofPay(String id) {
      
        try{    
            String sql = new StringBuilder() 
            .append("SELECT id, carid, total_price,")
            .append("TO_CHAR(releasDate, 'YYYY-MM-DD HH24:MI') AS rtime")
            .append("FROM PAY_INFO WHERE id =? ")
            .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql); 
        
                pstmt.setString(1, id);          
                ResultSet rs = pstmt.executeQuery();
                while(true){
                if(rs.next()){
                    PayInfo pay = new PayInfo();
                    pay.setId(rs.getString("ID"));
                    pay.setCarid(rs.getInt("CARID")); 
                    pay.setTotal_price(rs.getInt("total_price"));
                    pay.setReleasDate(rs.getString("RTIME"));
                    
                    listofpay.add(pay);
                }  else{
                    break;
                }

            }
            pstmt.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return listofpay;
    }
     */
    public Car getCarById(int carid){
        Car carById = null;

        

        for( int i =0; i< listofCars.size(); i++){
            Car car= listofCars.get(i);
            if(car!=null && car.getCarid()!= 0 && car.getCarid() == carid){
                carById = car;
                break;
            } 

        }
        return carById;
    }
    
    public void addTime(int carid,String day1, String day2){      
            try{
                String sql = new StringBuilder()
                .append("UPDATE CAR SET ")
                .append("starttime =TO_DATE(?,'YYYY-MM-DD-HH24-MI'), endtime =TO_DATE(?,'YYYY-MM-DD-HH24-MI')")
                .append("WHERE carid = ?")
                .toString();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, day1);
                pstmt.setString(2, day2);
                pstmt.setInt(3, carid);
                


                int rows = pstmt.executeUpdate();
                if(rows == 1){
                    System.out.println("수정 성공! ");
                    conn.commit();
                }
                pstmt.close();
            }catch(SQLException e){
                System.out.println(e);
            }
          
    }
    public void addPayInfo(PayInfo info){
        try{
            String sql = new StringBuilder()
            .append("INSERT INTO PAY_INFO (id,carid,total_price,releasDate)")
            .append(" VALUES (?,?,?,SYSDATE)")
            .toString();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, info.getId());
            pstmt.setInt(2, info.getCarid());
            pstmt.setDouble(3, info.getTotal_price());
            
            



            
            
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
    public void addReservation(Reservation info){
        try{
            String sql = new StringBuilder()
            .append("INSERT INTO RESERVATION (ID,carid,starttime,endtime,REGIST_DAY)")
            .append(" VALUES (?,?,TO_DATE(?,'YYYY-MM-DD-HH24-MI'),TO_DATE(?,'YYYY-MM-DD-HH24-MI'),SYSDATE)")
            .toString();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, info.getId());
            pstmt.setInt(2, info.getCarid());
            pstmt.setString(3, info.getStarttime());
            pstmt.setString(4, info.getEndtime());
            
            
            



            
            
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
    public boolean deleteCar(int carid){
        //셀렉문 추가 하셈
        int a = 0;
        try{

            String sql = new StringBuilder()
            .append("DELETE FROM CAR ")
            .append("WHERE carid = ?")
            .toString();
            System.out.println(sql);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, carid);

            int rows = pstmt.executeUpdate();
            if(rows == 1){
                System.out.println("삭제 성공");
                conn.commit();
                a++;
            }else{ System.out.println("대여 중 삭제 불가");
                
            }pstmt.close();

        }catch(SQLException e){
            System.out.println(e);
        }
        if(a > 0) {return true;
    }else {return false;}
}
public void commit(){
    try{
        conn.commit();

    }catch(SQLException e){
            System.out.println(e);
    }
}
public void rollback(){
    try{
        conn.rollback();

    }catch(SQLException e){
            System.out.println(e);
    }
}
}
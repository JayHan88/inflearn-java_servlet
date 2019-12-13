package JoinLoginApp;

import java.sql.Timestamp;

// Java Bean
public class MemberDto {
    // Declaration of properties
    // property에 직접 접근할 수 없도록 private 사
    private String id;
    private String pw;
    private String name;
    private String email;
    private Timestamp rdate;
    private String address;

    // Getter & Setter
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Timestamp getRdate() { return rdate; }
    public void setRdate(Timestamp rdate) { this.rdate = rdate; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}

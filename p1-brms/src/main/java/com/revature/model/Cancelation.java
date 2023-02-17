package com.revature.model;

public class Cancelation {

private String userid;
private String password;
private String tid;
private static double ref_amt;

public static double getRef_amt() {
	return ref_amt;
}
public static void setRef_amt(double ref_amt) {
	Cancelation.ref_amt = ref_amt;
}
public String getTid() {
	return tid;
}
public void setTid(String tid) {
	this.tid = tid;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
@Override
public String toString() {
	return "Cancelation [userid=" + userid + ", password=" + password + "]";
}


}

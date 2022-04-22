package kr.or.ddit.commit.vo;

public class PayVO {
	private int pay_num;
	private int paytype_num;
	private String paytype_name;
	private int pay_cost;
	private String pay_date;
	private String mem_id;

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getPaytype_num() {
		return paytype_num;
	}

	public String getPaytype_name() {
		return paytype_name;
	}

	public void setPaytype_name(String paytype_name) {
		this.paytype_name = paytype_name;
	}

	public void setPaytype_num(int paytype_num) {
		this.paytype_num = paytype_num;
	}

	public int getPay_cost() {
		return pay_cost;
	}

	public void setPay_cost(int pay_cost) {
		this.pay_cost = pay_cost;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

}

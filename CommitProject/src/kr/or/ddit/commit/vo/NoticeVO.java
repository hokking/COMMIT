package kr.or.ddit.commit.vo;

public class NoticeVO {
	
	private int notice_num;
	private String notice_title;
	private String notice_date;
	private String notice_con;
	private int notice_view;
	private String notice_head;
	
	
	public String getNotice_head() {
		return notice_head;
	}
	public void setNotice_head(String notice_head) {
		this.notice_head = notice_head;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_con() {
		return notice_con;
	}
	public void setNotice_con(String notice_con) {
		this.notice_con = notice_con;
	}
	public int getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}

}

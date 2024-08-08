package vss.beans;

public class News {
	
	// news_id, news_content
	private int news_id;
	private String  news_content;
	
	public News(String news_content) {
		super();
		this.news_content = news_content;
	}
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	
}

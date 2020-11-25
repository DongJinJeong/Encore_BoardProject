package encore.board.vo;

public class RepleVO {
	private int no;
	private int boardNo;
	private String userId;
	private String content;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "RepleVO [no=" + no + ", boardNo=" + boardNo + ", userId=" + userId + ", content=" + content + "]";
	}

}

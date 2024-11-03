package com.ssafy.model.dto;

public class BoardDto {
	
	private String boardId;
	private String boardContent;
	private String boardTitle;
	private String createDate;
	private int boardLevel;
	private String userId;
	private String updateDate;

	
	public BoardDto() {}
	
	public BoardDto(String boardId, String boardContent, String boardTitle, String createDate, int boardLevel,
			String userId, String updateDate) {
		super();
		this.boardId = boardId;
		this.boardContent = boardContent;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
		this.boardLevel = boardLevel;
		this.userId = userId;
		this.updateDate = updateDate;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	
	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardDto [boardId=").append(boardId).append(", boardContent=").append(boardContent)
				.append(", boardTitle=").append(boardTitle).append(", createDate=").append(createDate)
				.append(", boardLevel=").append(boardLevel).append(", userId=").append(userId).append(", updateDate=").append(updateDate)
				.append("]");
		return builder.toString();
	}
	
	

}

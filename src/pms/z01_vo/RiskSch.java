package pms.z01_vo;
// pms.z01_vo.RiskSch
public class RiskSch {
	// 1. 검색 속성 (일단 다 작성해놓고 실패하면 제거하겠습니다)
	private String subject; // 제목
	private String content; // 설명
	private int user_id; // 담당자 번호
	private int project_id; // 프로젝트 번호
	private String status; // 상태(신규,완료..)
	// 2. 페이징 처리
	private int count; // 총 데이터 건수
	private int pageSize; // 한페이지 보여줄 데이터 건수
	private int pageCount; // 총 페이지 수 count/pageSize
	private int curPage; // 클릭한 현재 페이지 번호
	private int start; // 페이지의 시작 번호
	private int end; // 페이지의 마지막 번호
	// 3. block 처리
	private int blockSize; // 한번에 보여줄 block의 크기
	private int startBlock; // block의 시작번호
	private int endBlock; // block의 마지막번호
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
}

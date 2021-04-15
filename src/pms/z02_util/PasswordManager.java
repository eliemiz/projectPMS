package pms.z02_util;

public class PasswordManager {
	
	/* Singleton */
	private PasswordManager() {}

	private static class LazyHolder {
		public static final PasswordManager INSTANCE = new PasswordManager();
	}
	
	public static PasswordManager getInstance() {
		return LazyHolder.INSTANCE;
	}
	
	/* 임시 비밀번호 생성 */
	public String createPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		StringBuilder sb = new StringBuilder();

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            sb.append(charSet[idx]);
        }
        
        return sb.toString();
	}
}

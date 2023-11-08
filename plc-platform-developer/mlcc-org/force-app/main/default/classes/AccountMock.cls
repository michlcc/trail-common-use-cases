public with sharing class AccountMock {
    private String id;
    private String name;
    private String email;

    public AccountMock(String name, String email) {
        this.id = randomAccountId();
        this.name = name;
        this.email = email;
    }

    public void AccountMockPF(){

    }

    public void AccountMockPJ(){

    }

    private static String randomAccountId(){
        return '' + randomSObjetId();
    }

    private static String randomSObjetId(){
        return '';
    }
}
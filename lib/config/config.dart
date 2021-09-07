class Config {
  static String serv = "dev"; // dev or prod
  static String baseUrl = "https://$serv-jsonplaceholder.typicode.com/users";
  static String getUrl() {
    return baseUrl;
  }
}



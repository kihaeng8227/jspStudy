package bookDao;

import bookDto.Book;

import java.util.ArrayList;

public class BookRepository {
    ArrayList<Book> listOfBooks = new ArrayList<Book>();;
    private static BookRepository instance = new BookRepository();

    public static BookRepository getInstance() {
        return instance;
    }

    public BookRepository() {
        listOfBooks = new ArrayList<>();
        Book book1 = new Book("u-00", "불편한 편의점", 12600);
        book1.setDescription("누적 판매 40만부 돌파, 2022년 가장 사랑받는 소설");
        book1.setAuthor("김호연");
        book1.setPublisher("나무옆의자");
        book1.setCategory("소설");
        book1.setUnitsInStock(5);
        book1.setTotalPages(200);
        book1.setReleaseDate("2022.07.29");
        book1.setCondition("신간도서");
        book1.setFileName("B1234.jpeg");

        Book book2 = new Book("r-11", "세상의 마지막 기차", 12600);
        book2.setDescription("봄이 시작되는 3월, 급행열차 한 대가 탈선해 절벽 아래로 떨어졌다.");
        book2.setAuthor("무라세 다케시");
        book2.setPublisher("모모");
        book2.setCategory("소설");
        book2.setUnitsInStock(15);
        book2.setTotalPages(250);
        book2.setReleaseDate("2022.05.28");
        book2.setCondition("중고도서");
        book2.setFileName("B1235.jpeg");

        Book book3 = new Book("a-22", "재벌집 막내아들1", 15300);
        book3.setDescription("2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안");
        book3.setAuthor("산경");
        book3.setPublisher("테라코타");
        book3.setCategory("소설");
        book3.setUnitsInStock(3);
        book3.setTotalPages(180);
        book3.setReleaseDate("2022.03.11");
        book3.setCondition("신간도서");
        book3.setFileName("B1236.jpeg");

        listOfBooks.add(book1);
        listOfBooks.add(book2);
        listOfBooks.add(book3);
    }

    public ArrayList<Book> getAllBooks() {
        return listOfBooks;
    }

    public Book getBookById(String bookId) {
        Book bookById = null;
        for (int i = 0; i < listOfBooks.size(); i++) {
            Book book = listOfBooks.get(i);
            if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
                bookById = book;
                break;
            }
        }
        return bookById;
    }

    public void addBook(Book book) {
        listOfBooks.add(book);
    }
}

package com.javarush.dao;

import com.javarush.model.Book;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BookDAOImpl implements BookDAO {


    @Autowired
    private SessionFactory sessionFactory;

    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
    }

    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
    }

    public void deleteBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book != null) {
            session.delete(book);
        }
    }

    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Integer(id));
        return book;
    }

    @SuppressWarnings("unchecked")
    public List<Book> listBooks(int rowsPerPage, int page, String criterion) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book where title like :criterion");
        query.setString("criterion", "%" + criterion + "%");
        if (rowsPerPage > 0) {
            query.setFirstResult((page - 1) * rowsPerPage);
            query.setMaxResults(rowsPerPage);
        }
        List<Book> listBooks = (List<Book>) query.list();
        return listBooks;
    }

    public long getBooksCount() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(id) from Book");
        return (Long) query.uniqueResult();
    }
}

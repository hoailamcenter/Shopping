package data;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import model.Product;

public class ProductDB {
	  public static void insert(Product product) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();        
	        try {
	            em.persist(product);
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }
	    }

	    public static void update(Product product) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();       
	        try {
	            em.merge(product);
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }
	    }

	    public static void delete(Product product) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();        
	        try {
	            em.remove(em.merge(product));
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }       
	    }
}

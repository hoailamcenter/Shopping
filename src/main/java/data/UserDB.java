package data;

import java.util.List;


import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.User;

public class UserDB {
	  public static void insert(User user) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();        
	        try {
	            em.persist(user);
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }
	    }

	    public static void update(User user) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();       
	        try {
	            em.merge(user);
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }
	    }

	    public static void delete(User user) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        trans.begin();        
	        try {
	            em.remove(em.merge(user));
	            trans.commit();
	        } catch (Exception e) {
	            System.out.println(e);
	            trans.rollback();
	        } finally {
	            em.close();
	        }       
	    }
	    
	    public static List<User> selectAllUsers() {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        String qString = "SELECT u FROM User u";
	        TypedQuery<User> q = em.createQuery(qString, User.class);
	        List<User> userList;
	        try {
	            userList = q.getResultList();
	        } catch (NoResultException e) {
	            userList = null;
	        } finally {
	            em.close();
	        }
	        return userList;
	    }

	    public static User selectById(User t) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();

	        try {
	            String jpql = "SELECT u FROM User u WHERE u.userId = :userId";
	            TypedQuery<User> query = em.createQuery(jpql, User.class);
	            query.setParameter("userId", t.getUserId());
	            return query.getSingleResult();
	        } catch (NoResultException e) {
	            return null; 
	        } finally {
	            em.close();
	        }
	    }

	    public User selectByUsernameAndPassword(User t) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        User ketQua = null;	   
	        try {
	            String jpql = "SELECT u FROM User u WHERE u.userName = :userName and u.password = :password";
	            TypedQuery<User> query = em.createQuery(jpql, User.class);
	            query.setParameter("userName", t.getUserName());
	            query.setParameter("password", t.getPassword());

	            List<User> resultList = query.getResultList();
	            if (!resultList.isEmpty()) {
	                ketQua = resultList.get(0);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            em.close();
	        }

	        return ketQua;
	    }

	    public boolean changePassword(User t) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        int ketQua = 0;

	        try {
	            trans.begin();

	            String jpql = "UPDATE User k SET k.password = :password WHERE k.userId = :userId";
	            Query query = em.createQuery(jpql);
	            query.setParameter("password", t.getPassword());
	            query.setParameter("userId", t.getUserId());

	            ketQua = query.executeUpdate();

	            trans.commit();
	        } catch (Exception e) {
	            if (trans != null && trans.isActive()) {
	                trans.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            em.close();
	        }

	        return ketQua > 0;
	    }

	    public boolean kiemTraTenDangNhap(String userName) {
	        boolean ketQua = false;

	        try {	        
	            EntityManager em = DBUtil.getEmFactory().createEntityManager();

	            String jpql = "SELECT kh FROM User kh WHERE kh.userName = :userName";
	            TypedQuery<User> query = em.createQuery(jpql, User.class);
	            query.setParameter("userName", userName);
	            try {
	                query.getSingleResult();
	                ketQua = true;
	            } catch (NoResultException e) {
	            }
	            em.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return ketQua;
	    }
}

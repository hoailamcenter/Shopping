package data;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceException;
import jakarta.persistence.TypedQuery;
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
	    
	    public static List<Product> selectTop4Product() {
	        List<Product> list = new ArrayList<>();
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        try {
	            String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
	            list = query.setMaxResults(4).getResultList();
	        } catch (Exception e) {
	            e.printStackTrace();	         
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	        return list;
	    }

	    public static Product selectBestSellingProduct() {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        try {
	            String jpql = "SELECT p FROM Product p ORDER BY p.amount ASC";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
	            query.setMaxResults(1);

	            List<Product> resultList = query.getResultList();
	            if (!resultList.isEmpty()) {
	                return resultList.get(0);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	        return null; 
	    }
	    
	    public static List<Product> selectTop4BestSeller() {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();
	        try {	            
	            String jpql = "SELECT p FROM Product p ORDER BY p.amount DESC";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
	            query.setMaxResults(4);
	            List<Product> resultList = query.getResultList();
	            return resultList;
	        } catch (Exception e) {
	            e.printStackTrace();	            
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	        return null; 
	    }	    
	    
	    public static List<Product> selectAllProductByCategoryId(String category) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();

	        try {
	            String jpql = "SELECT p FROM Product p WHERE p.category = :category";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
	            query.setParameter("category", category);

	            List<Product> resultList = query.getResultList();
	            return resultList;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	        return null; 
	    }
	    
	    public static List<Product> selectAllProduct() {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();

	        try {
	            String jpql = "SELECT p FROM Product p";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);

	            List<Product> resultList = query.getResultList();
	            return resultList;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }

	        return null; 
	    }
	    
	    public static Product getProductById(String productId) {
	        EntityManager em = DBUtil.getEmFactory().createEntityManager();

	        try {
	            String jpql = "SELECT p FROM Product p WHERE p.productId = :productId";
	            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
	            query.setParameter("productId", productId);

	            return query.getSingleResult();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }

	        return null;
	    }
	    
	    public static List<Product> SearchByName(String txtsearch) {
			EntityManager em = DBUtil.getEmFactory().createEntityManager();

			try {
				String jpql = "SELECT p FROM Product p WHERE p.productName LIKE :searchName";
				TypedQuery<Product> query = em.createQuery(jpql, Product.class);
				query.setParameter("searchName", "%" + txtsearch + "%");

				List<Product> resultList = query.getResultList();
				return resultList;

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (em != null && em.isOpen()) {
					em.close();
				}
			}
			return null;
		}
	    
	    public static int getTotalProduct() {
			EntityManager em = DBUtil.getEmFactory().createEntityManager();
			try {
				String jpql = "SELECT COUNT(*) FROM Product";
				TypedQuery<Long> query = em.createQuery(jpql, Long.class);

				return query.getSingleResult().intValue();
			} finally {
				if (em != null && em.isOpen()) {
					em.close();
				}
			}
		}
	    
	    public static List<Product> getPagingProduct(int pageIndex, int pageSize) {
			EntityManager em = DBUtil.getEmFactory().createEntityManager();
			try {
				int startIndex = (pageIndex - 1) * pageSize;

				String jpql = "SELECT p FROM Product p";
				TypedQuery<Product> query = em.createQuery(jpql, Product.class);

				query.setFirstResult(startIndex);
				query.setMaxResults(pageSize);

				return query.getResultList();
			} finally {
				em.close();
			}
		}
	    
	    public void deleteProduct(String pid) {
			EntityManager em = DBUtil.getEmFactory().createEntityManager();
			EntityTransaction trans = em.getTransaction();

			try {
				trans.begin();
				Product productToDelete = em.find(Product.class, pid);

				if (productToDelete != null) {
					em.remove(productToDelete);
					trans.commit();
				} else {
					trans.rollback();
				}
			} finally {
				em.close();
			}
		}

		public void insertProduct(String productName, String descript, double price, String imgLink, int category,
				int amount) {
			EntityManager em = DBUtil.getEmFactory().createEntityManager();
			EntityTransaction trans = em.getTransaction();

			try {
				trans.begin();

				Product newProduct = new Product();
				newProduct.setProductName(productName);
				newProduct.setDescript(descript);
				newProduct.setPrice(price);
				newProduct.setImgLink(imgLink);
				newProduct.setCategory(category);
				newProduct.setAmount(amount);

				em.persist(newProduct);

				trans.commit();
			} catch (PersistenceException e) {
				if (trans != null && trans.isActive()) {
					trans.rollback();
				}
				e.printStackTrace();
			} catch (Exception e) {
				if (trans != null && trans.isActive()) {
					trans.rollback();
				}
				e.printStackTrace();
			} finally {
				em.close();
			}
		}
}

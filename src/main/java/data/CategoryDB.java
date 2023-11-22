package data;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Category;

public class CategoryDB {
	public static List<Category> selectAllCategory() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            String jpql = "SELECT p FROM Category p";
            TypedQuery<Category> query = em.createQuery(jpql, Category.class);

            List<Category> resultList = query.getResultList();
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
}

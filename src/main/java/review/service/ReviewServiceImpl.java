package review.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import review.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void writeReview(Map<String, String> map) {
		reviewDAO.writeReview(map);
	}

}

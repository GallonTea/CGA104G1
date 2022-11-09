package com.util;

import org.hibernate.Session;

public interface ItemCommon {
	default Session getSesion() {
		return HibernateUtil.getSessionFactory().getCurrentSession();
	}
}

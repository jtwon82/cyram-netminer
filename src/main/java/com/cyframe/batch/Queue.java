package com.cyframe.batch;

import java.util.ArrayList;
import java.util.List;

public final class Queue<T> {

	private final List<T> queue = new ArrayList<T>();

	/**
	 * 현재 queue에 저장된 모든 객체를 꺼내어 리턴한다.
	 * 
	 * @return
	 */
	public List<T> flush() {
		synchronized (queue) {
			List<T> objectList = new ArrayList<T>();
			objectList.addAll(queue);
			queue.clear();
			return objectList;
		}
	}

	/**
	 * 현재 queue로부터 객체를 꺼내어 온다 (FIFO).<br>
	 * 만을 queue가 비어 있으면 queue가 찰때까지 Thread는 block 된다.
	 * 
	 * @return
	 */
	public T pop() {
		synchronized (queue) {
			while (queue.isEmpty()) {
				try {
					queue.wait();
				} catch (InterruptedException e) {
				}
			}

			return queue.remove(0);
		}
	}

	/**
	 * 핸재 queue에 객체를 추가한다.
	 * 
	 * @param obj
	 */
	public void push(T obj) {
		synchronized (queue) {
			queue.add(queue.size(), obj);
			queue.notifyAll();
		}
	}

	/**
	 * 핸재 queue에 동일한 내용이 존재하는지 확인한다.
	 * 
	 * @param obj
	 */
	public boolean exists(T obj) {
		synchronized (queue) {
			boolean exists = false;
			Object[] objArray = queue.toArray(new Object[0]);
			for (int i = 0; i < objArray.length; i++) {
				if (obj.equals(objArray[i])) {
					exists = true;
					break;
				}
			}
			return exists;
		}
	}

	/**
	 * 현재 queue에 저장된 객체의 갯수를 리턴한다.
	 * 
	 * @return
	 */
	public int size() {
		return queue.size();
	}

}

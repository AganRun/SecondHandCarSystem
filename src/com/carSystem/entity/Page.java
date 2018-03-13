package com.carSystem.entity;

public class Page {

	//ҳ�����ڼ�ҳ��
	private int currentpage;
	
	//һ���ж���������
	private int total;
	
	//ÿҳ��ʾ������
	private int size;
	
	private int front;
	
	//��һҳ
	private int next;
	
	//���һҳ
	private int last;
	
	public Page() {
		super();
	}

	public Page(int listSize, int size){
		super();
		currentpage = 1;
		total = listSize;
		this.size = size;
		next = currentpage + 1;
		front = currentpage - 1;
		last =  total%size== 0 ? total/size : (total/size)+1;
		last = last == 0 ? 1 : last; 
	}
	

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
		next = currentpage + 1;
		front = currentpage - 1;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getFront() {
		return front;
	}

	public void setFront(int front) {
		this.front = front;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	@Override
	public String toString() {
		return "Page [currentpage=" + currentpage + ", total=" + total + ", size=" + size + ", front=" + front
				+ ", next=" + next + ", last=" + last + "]";
	}
	
	
	
}

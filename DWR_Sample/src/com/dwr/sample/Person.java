package com.dwr.sample;

import org.directwebremoting.Security;


public class Person {
	
    private String name;
    private String address;
    private float salary;
    private int id;
    
	/**
     * @return the address
     */
    public String getAddress()
    {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address)
    {
        this.address = Security.escapeHtml(address);
    }

    /**
     * @return the id
     */
    public int getId()
    {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id)
    {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName()
    {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name)
    {
        this.name = Security.escapeHtml(name);
    }

    /**
     * @return the salary
     */
    public float getSalary()
    {
        return salary;
    }

    /**
     * @param salary the salary to set
     */
    public void setSalary(float salary)
    {
        this.salary = salary;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj)
    {
        if (obj == null)
        {
            return false;
        }

        if (obj == this)
        {
            return true;
        }

        if (!this.getClass().equals(obj.getClass()))
        {
            return false;
        }

        Person that = (Person) obj;

        if (this.id != that.id)
        {
            return false;
        }

        return true;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode()
    {
        return 5924 + id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    public String toString()
    {
        return "Person[id=" + id + ",name=" + name + "]";
    }
}

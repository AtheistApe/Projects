
/**
 * Write a description of class QuickFind here.
 * 
 * @author (Gary Church) 
 * @version (1.0)
 */
public class QuickFindUF
{
    private int[] id;

    /**
     * Constructor for objects of class QuickFind
     */
    public QuickFindUF(int N)
    {
        // initialise instance variables
        id = new int[N];
        for (int i = 0; i < N; i++)
        {
            id[i] = i;
        }
    }

    public boolean connected(int p, int q)
    {
        return id[p] == id[q];
    }
    
    public void union(int p, int q)
    {
        int pid = id[p];
        int qid = id[q];
        for (int i = 0; i < id.length; i++)
        {
            if (id[i] == pid)
            {
                id[i] = qid;
            }
        }
    }
}

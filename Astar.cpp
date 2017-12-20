// 8 puzzle problem using a* algorithm
// @author GAURAV KRISHNA  bt12cse029


#include <bits/stdc++.h>
//#include <functional>
using namespace std;

map<vector<vector<int> > , bool> visited;      //key value map , key is node and value is bool value of visit
map<vector<vector<int> > , vector<vector<int> > > parent;
vector<vector<int> > goal(3,vector<int> (3));     //initializing goal 2d vector 3 rows havign a vector of lenght 3 in each row

bool visit(vector<vector<int> > a)   //takes an node and checks using the map if it is visited or not
{
	if(visited[a]==true)
		return true;
	else
		return false;
}

int manhattan(vector<vector<int> > a , int moves)   //returns the manhatten distance
{
	int dist=moves;
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(a[i][j]!=0)
			{
				for(int k=0;k<3;k++)
				{
					for(int l=0;l<3;l++)
					{
						if(a[i][j]==goal[k][l])
							dist+=abs(i-k)+abs(j-l);
					}
				}
			}
		}
	}
	
	return dist;
}

bool isGoal(vector<vector<int> > a)   // returns if the given node is goal node or not
{
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(a[i][j]!=goal[i][j])
				return false;
		}
	}

return true;
}

bool safe(int i,int j)			//if the move is safe or not
{
	if(i>=0 && i<=2 && j>=0 && j<=2)
	return true;
	else
	return false;
}

int dx[]={-1,+1,0,0};
int dy[]={0,0,-1,+1};

vector<vector<vector<int> > > neighbours(vector<vector<int> > a)
{
	pair<int,int> pos;
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(a[i][j]==0)           // returns the position of 0 element
			{
				pos.first=i;
				pos.second=j;
				break;
			}
		}
	}

	vector<vector<vector<int> > > ans;      //ans contains the set of nodes
	for(int k=0;k<4;k++)
	{
		int cx = pos.first;
		int cy = pos.second;
		vector<vector<int> > n = a;
		if(safe(cx+dx[k],cy+dy[k]))
		{
			swap(n[cx+dx[k]][cy+dy[k]],n[cx][cy]);        //move 0 to all the possible positions 
			ans.push_back(n);								//store in set of nodes
		}
	}

return ans; 											//return the set of nodes
}							
		
typedef pair<vector<vector<int> > , int> state;			//state is a pair of 2d vector and int

struct cmp
{
	bool operator() (state &a, state &b)
	{
		int am = manhattan(a.first,a.second);
		int bm = manhattan(b.first,b.second);
		return am<bm;
	}
};

void print_path(vector<vector<int> > s)       // prints the path after reccursion to the top
{
   if(parent.count(s))
   print_path(parent[s]);
   
   for(int i=0;i<3;i++)
   {
	 for(int j=0;j<3;j++)
	 {
		printf("%d ",s[i][j]);
	 }
	cout<<endl;
   }
   
   cout<<endl;
 return;
}

void print(vector<vector<int> > s)				// prints the node
{
	for(int i=0;i<3;i++)
   {
	 for(int j=0;j<3;j++)
	 {
		printf("%d ",s[i][j]);
	 }
	cout<<endl;
   }
}

void solve(vector<vector<int> > a, int moves)
 {
	
	priority_queue<state,vector<state>,cmp > Q;
	Q.push(state(a,moves));
	while(!Q.empty())
	{
		vector<vector<int> > s = Q.top().first;
		Q.pop();
		
		visited[s]=true;
		//print(s);
		if(s==goal) 
		{
			//	printf("yeah\n");
			print_path(s);
			break;
		}
		vector<vector<vector<int> > > ns = neighbours(s);
		vector<vector<vector<int> > >::iterator it;
		//printf("1..\n");
		for(it=ns.begin();it!=ns.end();it++)
		{
			//print(*it);
			//cout<<endl;
			vector<vector<int> > temp = *it;
			if(!visit(temp))
			{
				parent.insert(pair<vector<vector<int> > , vector<vector<int> > >(temp,s));
				Q.push(state(temp,moves+1));
			}
		}
	}
	return;
 }

int main()
{
	vector<vector<int> > a(3,vector<int> (3));
	//vector<vector<int> > goal(3,vector<int> (3));
	
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			cin>>a[i][j];	
		}
	}
	cout<<" Finding Solution...\n\n";
	goal[0][0] = 1;
	goal[0][1] = 2;
	goal[0][2] = 3;
	goal[1][0] = 4;
	goal[1][1] = 5;
	goal[1][2] = 6;
	goal[2][0] = 7;
	goal[2][1] = 8;
	goal[2][2] = 0;
	
	solve(a,0);
}

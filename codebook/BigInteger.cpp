#include<iostream>
#include<time.h>
#include<cstdio>
#include<cstring>
#include<string>
#include<cmath>
#include<stack>
#include<queue>
#include<vector>
#include<set>
#include<algorithm>
using namespace std;
const double PI=acos(-1);
const int SIZE=110;
const int INF=0x3f3f3f3f;
const int MAXM=2000;
 
struct BigInteger {
    int len, s[SIZE + 5];
 
    BigInteger () {
        memset(s, 0, sizeof(s));
        len = 1;
    }
    BigInteger operator = (const char *num) { //字符串?值
        memset(s, 0, sizeof(s));
        len = strlen(num);
        for(int i = 0; i < len; i++) s[i] = num[len - i - 1] - '0';
        return *this;
    }
    BigInteger operator = (const int num) { //int ?值
        memset(s, 0, sizeof(s));
        char ss[SIZE + 5];
        sprintf(ss, "%d", num);
        *this = ss;
        return *this;
    }
    BigInteger (int num) {
        *this = num;
    }
    BigInteger (char* num) {
        *this = num;
    }
    string str() const { //?化成string
        string res = "";
        for(int i = 0; i < len; i++) res = (char)(s[i] + '0') + res;
        if(res == "") res = "0";
        return res;
    }
    BigInteger clean() {
        while(len > 1 && !s[len - 1]) len--;
        return *this;
    }
 
    BigInteger operator + (const BigInteger& b) const {
        BigInteger c;
        c.len = 0;
        for(int i = 0, g = 0; g || i < max(len, b.len); i++) {
            int x = g;
            if(i < len) x += s[i];
            if(i < b.len) x += b.s[i];
            c.s[c.len++] = x % 10;
            g = x / 10;
        }
        return c.clean();
    }
 
    BigInteger operator - (const BigInteger& b) {
        BigInteger c;
        c.len = 0;
        for(int i = 0, g = 0; i < len; i++) {
            int x = s[i] - g;
            if(i < b.len) x -= b.s[i];
            if(x >= 0) g = 0;
            else {
                g = 1;
                x += 10;
            }
            c.s[c.len++] = x;
        }
        return c.clean();
    }
 
    BigInteger operator * (const int num) const {
        int c = 0, t;
        BigInteger pro;
        for(int i = 0; i < len; ++i) {
            t = s[i] * num + c;
            pro.s[i] = t % 10;
            c = t / 10;
        }
        pro.len = len;
        while(c != 0) {
            pro.s[pro.len++] = c % 10;
            c /= 10;
        }
        return pro.clean();
    }
 
    BigInteger operator * (const BigInteger& b) const {
        BigInteger c;
        for(int i = 0; i < len; i++) {
            for(int j = 0; j < b.len; j++) {
                c.s[i + j] += s[i] * b.s[j];
                c.s[i + j + 1] += c.s[i + j] / 10;
                c.s[i + j] %= 10;
            }
        }
        c.len = len + b.len + 1;
        return c.clean();
    }
 
    BigInteger operator / (const BigInteger &b) const {
        BigInteger c, f;
        for(int i = len - 1; i >= 0; --i) {
            f = f * 10;
            f.s[0] = s[i];
            while(f >= b) {
                f = f - b;
                ++c.s[i];
            }
        }
        c.len = len;
        return c.clean();
    }
    //高精度取模
    BigInteger operator % (const BigInteger &b) const{
        BigInteger r;
        for(int i = len - 1; i >= 0; --i) {
            r = r * 10;
            r.s[0] = s[i];
            while(r >= b) r = r - b;
        }
        r.len = len;
        return r.clean();
    }
 
    bool operator < (const BigInteger& b) const {
        if(len != b.len) return len < b.len;
        for(int i = len - 1; i >= 0; i--)
            if(s[i] != b.s[i]) return s[i] < b.s[i];
        return false;
    }
    bool operator > (const BigInteger& b) const {
        return b < *this;
    }
    bool operator <= (const BigInteger& b) const {
        return !(b < *this);
    }
    bool operator == (const BigInteger& b) const {
        return !(b < *this) && !(*this < b);
    }
    bool operator != (const BigInteger &b) const {
        return !(*this == b);
    }
    bool operator >= (const BigInteger &b) const {
        return *this > b || *this == b;
    }
    friend istream & operator >> (istream &in, BigInteger& x) {
        string s;
        in >> s;
        x = s.c_str();
        return in;
    }
    friend ostream & operator << (ostream &out, const BigInteger& x) {
        out << x.str();
        return out;
    }
};
 
int n,s;
BigInteger dp[55][1010];;
 
int main()
{
    while(scanf("%d%d",&n,&s)!=EOF)
    {
        if (s&1) {
            printf("0\n");
            continue;
        }
        s=s/2;
        memset(dp,0,sizeof(dp));
        for (int i=0;i<=9;i++)
            dp[1][i]=1;
        for (int i=2;i<=n;i++) {
            for (int j=s;j>=0;j--) {
                for (int k=0;k<=9;k++) {
                    if (j-k>=0&&dp[i-1][j-k]!=0) {
                        dp[i][j]=dp[i][j]+dp[i-1][j-k];
                    }
                }
            }
        }
        BigInteger ans=(dp[n][s]*dp[n][s]);
        cout<<ans<<endl;
    }
    return 0;
}


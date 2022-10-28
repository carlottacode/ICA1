
awk 'BEGIN{FS="\t";}
{
if($1==0)
{a=1e-17}
else 
{a=$1;}
if($2==0)
{b=1e-17}
else
{b=$2;}
{fc=(a/b);}
}
{
if(fc==1)
{print 0}
else 
{print log(fc)/log(2);}}'

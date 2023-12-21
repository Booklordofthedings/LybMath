namespace LybMath.Vectors;
using System;
struct vec2 : IParseable<vec2>
{
	public float x = 0;
	public float y = 0;

#region constructors
	public this()
	{
	}
	public this(float val)
	{
		x = val;
		y = val;
	}
	public this(float x, float y)
	{
		this.x = x;
		this.y = y;
	}
	public this(double val)
	{
		this.x = (.)val;
		this.y = (.)val;
	}
	public this(double x, double y)
	{
		this.x = (.)x;
		this.y = (.)y;
	}
#endregion
#region constants
	public const vec2 Zero = .(0);
	public const vec2 One = .(1);
	public const vec2 MaxInfinity = .(float.PositiveInfinity);
	public const vec2 MinInfinity = .(float.NegativeInfinity);
	public const vec2 Max = .(float.MaxValue);
	public const vec2 Min = .(float.MinValue);
	public const vec2 Up = .(0,1);
	public const vec2 Down = .(0,-1);
	public const vec2 Left = .(-1,0);
	public const vec2 Right = .(1,0);
#endregion

	public float this[int64 val]
	{
		[Inline] public get {
			if(val == 0)
				return x;
			else if(val == 1)
				return y;
			else
				Runtime.FatalError("Vector index out of bounds error");
		}

		[Inline] public set mut {
			if(val == 0)
				x = value;
			else if(val == 1)
				y = value;
			else
				Runtime.FatalError("Vector index out of bounds error");
		}
	}

	public float Length
	{
		[Inline] public get {
			return System.Math.Sqrt(x*x + y*y);
		}
	}

	public float SqrLength
	{
		[Inline] public get {
			return x*x + y*y;
		}
	}

	public vec2 Normalized
	{
		[Inline] public get {
			float length = this.Length;
			return .(x/length,y/length);
		}
	}

	public void Normalize() mut
	{
		float lenght = this.Length;
		this.x = x/lenght;
		this.y = y/lenght;
	}

	public static float Dot(vec2 a, vec2 b)
	{
		return a.x * b.x + a.y * b.y;
	}

	public static float Angle(vec2 from, vec2 to)
	{

	}

	public override void ToString(String strBuffer)
	{
		strBuffer.Append(scope $"{x}|{y}");
	}

	public static Result<vec2> Parse(StringView val)
	{
		if(!val.Contains('|'))
			return .Err;
		var splitter = val.Split('|');
		var x = splitter.GetNext();
		if(x case .Err)
			return .Err;
		var y = splitter.GetNext();
		if(y case .Err)
			return .Err;
		var xParsed = float.Parse(x.Value);
		if(xParsed case .Err)
			return .Err;
		var yParsed = float.Parse(y.Value);
		if(yParsed case .Err)
			return .Err;
		return .Ok(.(xParsed.Value,yParsed.Value));
	}

	[Commutable, Inline]
	public static vec2 operator+(vec2 lhs, vec2 rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y);
	}

	[Inline,Commutable]
	public static vec2 Add(vec2 lhs, vec2 rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y);
	}

	[Inline]
	public static vec2 operator-(vec2 lhs, vec2 rhs)
	{
		return .(lhs.x - rhs.x, lhs.y - rhs.y);
	}

	[Inline]
	public static vec2 Subtract(vec2 lhs, vec2 rhs)
	{
		return .(lhs.x - rhs.x, lhs.y - rhs.y);
	}

	[Inline,Commutable]
	public static vec2 operator*(vec2 lhs, float rhs)
	{
		return .(lhs.x * rhs, lhs.y * rhs);
	}

	[Inline,Commutable]
	public static vec2 Multiply(vec2 lhs, float rhs)
	{
		return .(lhs.x * rhs, lhs.y * rhs);
	}

	[Inline]
	public static bool operator==(vec2 lhs, vec2 rhs)
	{
		if(lhs.x != rhs.x)
			return false;
		else if(lhs.y != rhs.y)
			return false;
		return true;
	}

	[Inline]
	public static bool Equals(vec2 lhs, vec2 rhs)
	{
		if(lhs.x != rhs.x)
			return false;
		else if(lhs.y != rhs.y)
			return false;
		return true;
		
	}

	[Inline]
	public static bool RoughEquals(vec2 lhs, vec2 rhs)
	{
		if((lhs - rhs).SqrLength < 0.00005)
			return true;
		return false;
	}

	[Inline]
	public static vec2 ToVec2()
	{
		Runtime.NotImplemented();
	}

	[Inline]
	public static vec2 ToVec3()
	{
		Runtime.NotImplemented();
	}
}
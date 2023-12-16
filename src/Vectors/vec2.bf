namespace LybMath.Vectors;

struct vec2 : System.IParseable<vec2>
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
		public get {
			if(val == 0)
				return x;
			else if(val == 1)
				return y;
			else
				System.Runtime.FatalError("Vector index out of bounds error");
		}

		public set mut {
			if(val == 0)
				x = value;
			else if(val == 1)
				y = value;
			else
				System.Runtime.FatalError("Vector index out of bounds error");
		}
	}

	public float Length
	{
		public get {
			return System.Math.Sqrt(x*x + y*y);
		}
	}

	public float SqrLength
	{
		public get {
			return x*x + y*y;
		}
	}

	public vec2 Normalized
	{
		public get {
			float length = this.Length;
			return .(x/length,y/length);
		}
	}

	public override void ToString(System.String strBuffer)
	{
		strBuffer.Append(scope $"{x}|{y}");
	}

	public static System.Result<vec2> Parse(System.StringView val)
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

	[System.Commutable]
	public static vec2 operator+(vec2 lhs, vec2 rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y);
	}
}
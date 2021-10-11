function scr_get_fraction(value)
{
	return value - (floor(abs(value)) * sign(value));
}
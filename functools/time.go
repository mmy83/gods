package functools

import (
	"time"
)

func Phpdate(timeint int64) string {
	tm := time.Unix(timeint, 0)
	s := tm.Format("2006-01-02T15:04:05Z07:00")
	return s
}

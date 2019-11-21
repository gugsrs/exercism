class Clock:
    def __init__(self, hour, minute):
        self.hour = hour % 24
        self.minute = minute % 60
        if minute >= 60 or minute <= 60:
            self.hour = int(hour + (minute - self.minute) / 60) % 24

    def __repr__(self):
        return f"{self.hour:02}:{self.minute:02}"

    def __eq__(self, other):
        conditions = (
            self.hour == other.hour,
            self.minute == other.minute,
        )
        if all(conditions):
            return True
        return False

    def __add__(self, minutes):
        minutes = self.minute + minutes
        return Clock(self.hour, minutes)

    def __sub__(self, minutes):
        minutes = self.minute - minutes
        return Clock(self.hour, minutes)

import pygame

def get_pixels(surface):
    """Returns an array of all pixels' rgb values in a surface"""
    pixels = []
    for y in range(surface.get_height()):
        for x in range(surface.get_width()):
            pixels.append(surface.get_at((x,y))[:3])
    return pixels        

def greyscale(surface):
    """Converts a surface into a 
    black and white equivalent.

    Note that we're using an 8x8 surface.
    The smaller the surface, the 'fuzzier' our image
    search will be.

    Returns a pygame surface
    """
    surface = pygame.transform.scale(surface, (8, 8))
    greyscale = pygame.Surface((8, 8))
    for y in range(surface.get_height()):
        for x in range(surface.get_width()):
            greyscale.set_at((x, y), return_average(surface.get_at((x,y))))
    return greyscale        

def return_average(rgb):
    """Creates an average array of
    colour values
    """
    value = sum(rgb[:3])//3 
    return (value, value, value)

def average_image_value(surface):
    """Returns the average pixel value for an image.
    
    The average pixel value is the most used rgb value
    that is present in the image."""
    return sum(
          [pixels[0] for pixels in get_pixels(surface)]
    ) // len(get_pixels(surface))


def image_hash(image_location):
    """image_location is a file path to the image.
    
    First we load the surface,
    turn it to a small 8x8 greyscale copy
    get the average rgb from that
    and create our hash from the average rgbs
    """
    image = pygame.image.load(image_location)
    grey = greyscale(image)
    avg = average_image_value(grey)

    bitstring = ''
    for pixels in get_pixels(grey):
        if pixels[0] < avg:
            bitstring += '1'
        else: bitstring += '0'
    hash = int(bitstring, 2).__format__('016x').upper()
    return hash    


if __name__ == '__main__' :
    image_hash('image.jpg')
